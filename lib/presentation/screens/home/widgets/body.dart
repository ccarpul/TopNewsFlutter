import 'package:flutter/material.dart';
import 'package:top_news_flutter/domain/entity/article.dart';
import 'package:top_news_flutter/presentation/shared/shared_widget.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.articles, required this.onSave});

  final String title = 'Now in Unite States';
  final List<Article> articles;
  final ValueChanged<Article> onSave;


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      children: [
        TitleScreen(textColor: theme.onPrimaryContainer, text: title),
        PagerNews(articles: articles, onSave: onSave),
      ],
    );
  }
}
