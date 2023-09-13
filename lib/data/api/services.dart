import 'dart:convert' as convert;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:top_news_flutter/data/api/client.dart';
import 'package:top_news_flutter/data/models/top_news_response_model.dart';

class ApiService {
  static Future<ResponseData> topNews({String country = 'us'}) async {
    final url = Uri.parse(NewsApiClient.topNews());
    final Response response;

    try {
      response = await http.get(url);
    } on Exception {
      throw Exception('There is an exception');
    } catch (e) {
      throw Exception('unknow expection');
    }

    if (response.statusCode != 200) {
      throw const HttpException('Wrong request Exception');
    }
    try {
      final jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      return ResponseData.fromJson(jsonResponse);
    } catch (e) {
      throw FormatException('Decode exception with message $e');
    }
  }
}
