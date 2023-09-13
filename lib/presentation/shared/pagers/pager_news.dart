import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_news_flutter/domain/entity/article.dart';
import 'package:top_news_flutter/presentation/screens/providers/pager_provider.dart';
import 'package:top_news_flutter/presentation/shared/cards/card_news.dart';
import 'package:top_news_flutter/presentation/shared/pagers/dot_indicator_pager.dart';

const scaleFraction = 0.9;
const fullScale = 0.2;
const pagerSize = 380.0;

class PagerNews extends StatefulWidget {
  const PagerNews({super.key, required this.articles, required this.onSave});

  final List<Article> articles;
  final ValueChanged<Article> onSave;

  @override
  State<PagerNews> createState() => _PagerNewsState();
}

class _PagerNewsState extends State<PagerNews> {
  double viewPortFraction = 0.8;

  late PageController pageController;
  late PagerViewProvider pagerProvider;

  double page = 0.0;

  @override
  void initState() {
    super.initState();
    pagerProvider = context.read<PagerViewProvider>();
    pageController = PageController(
        initialPage: pagerProvider.page, viewportFraction: viewPortFraction);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: pagerSize,
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if (notification is ScrollUpdateNotification) {
                setState(() {
                  page = pageController.page ?? 0.0;
                });
              }
              return false;
            },
            child: PageView.builder(
              onPageChanged: (pos) {
                setState(() {
                  pagerProvider.page = pos;
                });
              },
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              itemCount: widget.articles.length,
              itemBuilder: (context, index) {
                final scale = max(scaleFraction,
                    (fullScale - (index - page).abs()) + viewPortFraction);
                return Align(
                  alignment: Alignment.center,
                  child: Transform.scale(
                      scale: scale,
                      child: CardNews(
                        article: widget.articles[index],
                        onSave: widget.onSave,
                      )
                      ),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 20,),
        DotIndicator(controller: pageController, length: widget.articles.length)
      ],
    );
  }
}