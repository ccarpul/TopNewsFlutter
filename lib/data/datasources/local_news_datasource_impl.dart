import 'package:top_news_flutter/domain/entity/article.dart';
import 'package:top_news_flutter/utils/mocks/article.dart';

import '../../domain/datasources/news_datasource.dart';

class LocalNewsDataSource implements NewsDataSource {
  @override
  Future<List<Article>> getTopNews() async {
    return get100Articles();
  }
}
