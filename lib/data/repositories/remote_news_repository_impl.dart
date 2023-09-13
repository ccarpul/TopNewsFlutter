
import 'package:top_news_flutter/domain/datasources/news_datasource.dart';
import 'package:top_news_flutter/domain/entity/article.dart';
import 'package:top_news_flutter/domain/repositories/news_repositoty.dart';

class NewsRepositoryImpl implements NewsRepository {
      final NewsDataSource newsDataSource;

  NewsRepositoryImpl({required this.newsDataSource});

  @override
  Future<List<Article>> getTopNews() {
    return newsDataSource.getTopNews();
  }  
}