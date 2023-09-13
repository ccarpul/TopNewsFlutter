import 'package:flutter/material.dart';

import '../../../domain/entity/article.dart';

class SavedArticlesProvider with ChangeNotifier {

  List<Article> _savedArticles = [];

  set saveArticles(List<Article> articles) {
    _savedArticles = articles;
    notifyListeners();
  }

  List<Article> get savedArticles => _savedArticles;
}