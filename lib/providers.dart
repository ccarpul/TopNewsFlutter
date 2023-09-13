
import 'package:provider/provider.dart';
import 'package:top_news_flutter/data/datasources/remote_news_datasource_impl.dart';

import 'data/database/article_db.dart';
import 'data/repositories/remote_news_repository_impl.dart';
import 'presentation/screens/providers/providers.dart';

class Providers {
  static final newsRepository = NewsRepositoryImpl(newsDataSource: RemoteNewsDataSource());
  //final newsRepository = NewsRepositoryImpl(newsDataSource: LocalNewsDataSource());
  static List list = [
        ChangeNotifierProvider(
          create: (context) => NavigationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ArticlesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SavedArticlesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PagerViewProvider(),
        ),
        ChangeNotifierProxyProvider<ArticlesProvider, NewsProvider>(
          create: (context) => NewsProvider(newsRepository: newsRepository, articleDB: ArticleDB(), articlesProvider: Provider.of<ArticlesProvider>(context, listen: false)),
          update: (context, articlesProvider, newsProvider) => NewsProvider(newsRepository: newsRepository, articleDB: ArticleDB(), articlesProvider: articlesProvider),
        ),
        ChangeNotifierProxyProvider<SavedArticlesProvider, SavedNewsProvider>(
          create: (context) => SavedNewsProvider( ArticleDB(), Provider.of<SavedArticlesProvider>(context, listen: false)),
          update: (context, articlesProvider, newsProvider) => SavedNewsProvider( ArticleDB(), articlesProvider),
        ),
      ];
}
