

import 'package:flutter/material.dart';

import '../../../domain/entity/article.dart';

class ArticlesProvider with ChangeNotifier {

  List<Article> _articles = [];

  set articles(List<Article> articles) {
    _articles = articles;
    notifyListeners();
  }

  List<Article> get articles => _articles;
}