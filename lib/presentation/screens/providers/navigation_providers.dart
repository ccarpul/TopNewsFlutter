import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:top_news_flutter/config/routes/app_routes.dart';

class NavigationProvider extends ChangeNotifier {

  int _currentIndex = 0;

  NavigationProvider();

  void newIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  int getCurrentIndex() => _currentIndex;

  void onTap(int newIndex, NavigationProvider provider, BuildContext context) {
    provider.newIndex(newIndex);
    
    if(context.canPop()) {
      context.pop(routes[newIndex]);
    } else {
      context.go(routes[newIndex]);
    }
  }
}