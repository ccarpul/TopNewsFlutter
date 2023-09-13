import 'package:flutter/material.dart';
import 'package:top_news_flutter/config/shared_preferences/shared_preferences.dart';
import 'package:top_news_flutter/data/database/article_db.dart';
import 'package:top_news_flutter/domain/entity/article.dart';
import 'package:top_news_flutter/domain/repositories/news_repositoty.dart';
import 'package:top_news_flutter/presentation/screens/home/home_state.dart';
import 'package:top_news_flutter/presentation/screens/providers/articles_provider.dart';
import 'package:top_news_flutter/utils/mocks/number_extensions.dart';

const String lastTimeFetchedKey = 'lastTimeFetchedKey';
const int tolerance = 1;

class NewsProvider extends ChangeNotifier {
  NewsProvider(
      {required this.newsRepository,
      required this.articleDB,
      required this.articlesProvider});

  final NewsRepository newsRepository;
  final ArticleDB articleDB;
  final ArticlesProvider articlesProvider;

  String lastTimeFetch = '';

  NewsState state = NewsState();

  save(Article article) async {
    updateOfflineArticlesDB(article);
    updateFavoriteArticlesDB(article);
    articlesProvider.articles = await getArticlesOffline();
  }

  Future<void> updateOfflineArticlesDB(Article article) async {
    await articleDB.update(
        title: article.title,
        isSaved: article.isSaved == 'yes' ? 'no' : 'yes',
        tableName: ArticleDB.tableNameOffline);
  }

  Future<void> updateFavoriteArticlesDB(Article article) async {
    article.isSaved != 'yes'
        ? await articleDB.create(ArticleDB.tableSaved,
            title: article.title,
            subtitle: article.subtitle,
            imageUrl: article.imageUrl ?? '',
            author: article.author ?? '',
            date: article.date ?? '',
            isSaved: 'yes')
        : await articleDB.delete(article.title, ArticleDB.tableSaved);
  }

  Future<void> load() async {
    final List<Article> articlesDatabase;

    try {
      articlesDatabase = await getArticlesOffline();

      if (articlesDatabase.isEmpty || await isExpired()) {
        final List<Article> newArticles = await getArticlesFromApi();
        await articleDB.createFromList(
            ArticleDB.tableNameOffline,
            newArticles
                .map((article) => article.toArticleDataBaseEntity())
                .toList());

        articlesProvider.articles = newArticles;
        MySharedPreferences.save(
            lastTimeFetchedKey, DateTime.now().millisecondsSinceEpoch);
      } else {
        articlesProvider.articles = articlesDatabase;
      }
      state = NewsState.success();
    } on FormatException {
      state = NewsState.error();
    } catch (e) {
      state = NewsState.error();
    }
  }

  Future<bool> isExpired() async {
    final lastTimeFetchMilliseconds =
        await MySharedPreferences.getInt(lastTimeFetchedKey);
    return (DateTime.now().millisecondsSinceEpoch - lastTimeFetchMilliseconds >
        tolerance.daysToMillis());
  }

  Future<List<Article>> getArticlesOffline() =>
      articleDB.fetchAll(ArticleDB.tableNameOffline);
  Future<List<Article>> getFavoriteArticles() =>
      articleDB.fetchAll(ArticleDB.tableSaved);

  Future<List<Article>> getArticlesFromApi() async {
    final savedDatabase = await getFavoriteArticles();
    return await newsRepository
        .getTopNews()
        .then((articles) => articles.map((article) {
              for (var favorite in savedDatabase) {
                if (article.title == favorite.title) {
                  article.isSaved = favorite.isSaved;
                }
              }
              return article;
            }).toList());
  }
}
