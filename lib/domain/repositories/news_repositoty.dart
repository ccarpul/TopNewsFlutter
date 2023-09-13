import 'package:top_news_flutter/domain/entity/article.dart';

abstract class NewsRepository {

  Future<List<Article>> getTopNews();
  
}