import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_news_flutter/domain/entity/article.dart';
import 'package:top_news_flutter/presentation/screens/home/home_state.dart';
import 'package:top_news_flutter/presentation/screens/home/widgets/body.dart';
import 'package:top_news_flutter/presentation/screens/home/widgets/loading.dart';
import 'package:top_news_flutter/presentation/screens/home/widgets/error.dart';
import 'package:top_news_flutter/presentation/screens/providers/articles_provider.dart';
import 'package:top_news_flutter/presentation/screens/providers/navigation_providers.dart';
import 'package:top_news_flutter/presentation/screens/providers/news_providers.dart';

import '../../shared/bars/custom_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String name = 'home_route';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late NewsProvider newsProvider;

  @override
  void initState() {
    super.initState();
    newsProvider = context.read<NewsProvider>();
    newsProvider.load();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    
    return Scaffold(
        backgroundColor: theme.primaryContainer,
        appBar: AppBar(
            backgroundColor: theme.primaryContainer,
            title: Text(
              'Top News',
              style: TextStyle(
                  color: theme.secondary, fontWeight: FontWeight.w500),
            )),
        body:  _getWidgetState(
          context.watch<ArticlesProvider>().articles,
           newsProvider.state,
           newsProvider.save
           ),
        bottomNavigationBar: Consumer<NavigationProvider>(
        builder: (context, provider, _) => CustomBottomNavigationBar(
          onTap: (int newIndex) => provider.onTap(newIndex, provider, context),
          currentIndex: provider.getCurrentIndex(),
        ),
      ),
    );
  }
}

Widget _getWidgetState(List<Article> articles, NewsState state, ValueChanged<Article> onSave) {
  switch (state.status) {
    case NewsStatus.loading:
      return const Loading();
    case NewsStatus.success:
      return Body(articles: articles, onSave: onSave,);
    case NewsStatus.error:
      return const Error();
    default:
      return const Error();
  }
}


