import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_news_flutter/presentation/screens/home/widgets/loading.dart';
import 'package:top_news_flutter/presentation/screens/providers/navigation_providers.dart';
import 'package:top_news_flutter/presentation/screens/providers/saved_articles_provider.dart';
import 'package:top_news_flutter/presentation/screens/providers/saved_news_providers.dart';
import 'package:top_news_flutter/presentation/screens/saved_news/saved_news_state.dart';
import 'package:top_news_flutter/presentation/screens/saved_news/widgets/saved_news_main_container.dart';

import '../../../domain/entity/article.dart';
import '../../shared/bars/custom_bottom_bar.dart';

class SavedNewsScreen extends StatefulWidget {
  static const String name = 'saved_news_route';

  const SavedNewsScreen({super.key});

  @override
  State<SavedNewsScreen> createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {

  late SavedNewsProvider savedNewsProvider;

  @override
  void initState() {
    super.initState();
    savedNewsProvider = context.read<SavedNewsProvider>();
    savedNewsProvider.load();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
        backgroundColor: theme.primaryContainer,
        body: _getSavedNewsState(
          context.watch<SavedArticlesProvider>().savedArticles, 
          savedNewsProvider.state,
          savedNewsProvider.save
        ),
        bottomNavigationBar: Consumer<NavigationProvider>(
          builder: (context, provider, _) => CustomBottomNavigationBar(
            onTap: (int newIndex) => provider.onTap(newIndex, provider, context),
            currentIndex: provider.getCurrentIndex(),
          ),
        ));
  }
}

Widget _getSavedNewsState(List<Article> articles, SavedNewsState state, ValueChanged<Article> onSave) {
  switch (state.status) {
    case SavedNewsStatus.loading:
      return const Loading();
    case SavedNewsStatus.success:
      return articles.isEmpty
          ? const Center(child: Text('Empty'))
          : SavedNewsMainContainer(
              articles: articles,
              onSave: onSave,
            );
    case SavedNewsStatus.error:
      return const Text('Error');
    default:
      return const Text('Error');
  }
}
