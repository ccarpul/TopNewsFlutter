import 'package:flutter/material.dart';
import 'package:top_news_flutter/domain/entity/article.dart';
import 'package:top_news_flutter/presentation/shared/cards/card_news.dart';
import 'package:top_news_flutter/presentation/shared/texts/title_screen.dart';

class SavedNewsMainContainer extends StatelessWidget {
  const SavedNewsMainContainer({
    super.key,
    required this.articles, required this.onSave,
  });

  final ValueChanged<Article> onSave;

  final List<Article> articles;

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Column(
      children: [
        const TitleScreen(text: 'Your saved news'),
        Expanded(
          child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (_, index) {
                return ListTile( title: CardNews(
                  article: articles[index],
                  onSave: onSave
                  )
                  );
              }),
        ),
      ],
    ),
  );
}