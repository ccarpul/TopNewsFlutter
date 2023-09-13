import 'package:top_news_flutter/data/models/article_model.dart';
import 'package:top_news_flutter/domain/datasources/news_datasource.dart';
import 'package:top_news_flutter/domain/entity/article.dart';

import '../api/services.dart';

class RemoteNewsDataSource implements NewsDataSource {
  
  @override
  Future<List<Article>> getTopNews() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = ApiService.topNews().then((data) =>
       data.articles
          .map((article) => ArticleModel.fromJson(article).toArticleEntity())
          .where((article) => article.title.isNotEmpty && article.subtitle.isNotEmpty)
          .toList()
    );
    return response;
  }
}
