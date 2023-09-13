import 'package:top_news_flutter/config/constants/environment.dart';

class NewsApiClient {
  static const _baseUrl = 'https://newsapi.org';
  static const _version = '/v2';
  static const _topNewsEndpoint = "/top-headlines";
  static final _apiKey = '?apiKey=${Environment.newsApiKey}';
  static String topNews({String country = 'us'}) => '$_baseUrl$_version$_topNewsEndpoint$_apiKey&country=$country';
}