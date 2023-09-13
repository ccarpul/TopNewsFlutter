import 'package:go_router/go_router.dart';
import 'package:top_news_flutter/presentation/screens.dart';

final routes = ['/', '/saved-news'];


final appRouter = GoRouter(
    initialLocation: '/', 
    routes: [
      GoRoute(
        path: '/',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
        ),
      GoRoute(
        path: '/saved-news',
        name: SavedNewsScreen.name,
        builder: (context, state) => const SavedNewsScreen(),
        ),
      ]
);
