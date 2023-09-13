import 'package:top_news_flutter/domain/entity/article.dart';

abstract class NewsDataSource {

  Future<List<Article>> getTopNews();
  
}