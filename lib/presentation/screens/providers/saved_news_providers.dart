import 'package:flutter/material.dart';
import 'package:top_news_flutter/data/database/article_db.dart';
import 'package:top_news_flutter/domain/entity/article.dart';
import 'package:top_news_flutter/presentation/screens/providers/saved_articles_provider.dart';
import 'package:top_news_flutter/presentation/screens/saved_news/saved_news_state.dart';

class SavedNewsProvider extends ChangeNotifier {
  SavedNewsProvider(this.articleDB, this.savedArticlesProvider);

  final ArticleDB articleDB;
  final SavedArticlesProvider savedArticlesProvider;
  SavedNewsState state = SavedNewsState();

  void save(Article article) async {
    await articleDB.update(
      title: article.title,
      isSaved: 'no',
      tableName: ArticleDB.tableNameOffline,
    );
    await articleDB.delete(article.title, ArticleDB.tableSaved);
    load();
  }

  Future<void> load() async {
    
    try {
      savedArticlesProvider.saveArticles = await articleDB.fetchAll(ArticleDB.tableSaved);
      state = SavedNewsState.success();
    } on FormatException {
      state = SavedNewsState.error();
    } catch (e) {
      state = SavedNewsState.error();
    }
  }
}
