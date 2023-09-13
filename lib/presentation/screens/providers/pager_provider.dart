import 'package:flutter/material.dart';

class PagerViewProvider with ChangeNotifier {

  int _currentPage = 0;

  set page(int page) => _currentPage = page;

  int get page => _currentPage;
}