import 'package:flutter/material.dart';
import 'package:top_news_flutter/config/theme/app_theme.dart';
import 'package:top_news_flutter/domain/entity/article.dart';
import 'package:top_news_flutter/utils/date_format.dart';

class CardNews extends StatelessWidget {
  const CardNews({super.key, required this.article, required this.onSave});

  final Article article;

  final ValueChanged<Article> onSave;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final Image image = article.imageUrl == '' || article.imageUrl == null
        ? Image.asset(
            'assets/images/ic_launcher.png',
            height: 170,
            fit: BoxFit.contain,
            width: double.infinity,
          )
        : Image.network(
            article.imageUrl ?? '',
            height: 170,
            fit: BoxFit.cover,
            width: double.infinity,
          );

    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: double.infinity),
      child: Card(
        color: colors.inversePrimary,
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(color: colors.onBackground, child: image),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Material(
                      type: MaterialType.transparency,
                      child: Ink(
                        decoration: BoxDecoration(
                            color: colors.primaryContainer.withAlpha(180),
                            borderRadius: const BorderRadius.all(
                                Radius.elliptical(4, 4))),
                        child: InkWell(
                          onTap: () => onSave(article),
                          child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                article.isSaved == 'yes'
                                    ? Icons.bookmark_add_rounded
                                    : Icons.bookmark_outline,
                                color: colors.tertiary,
                                size: 24,
                              )),
                        ),
                      ),
                    ))
              ],
            ),
            _Content(article),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content(this.article);

  final Article article;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        constraints: const BoxConstraints(minWidth: double.infinity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.title,
            ),
            const SizedBox(height: 10),
            Text(
              article.subtitle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTheme.body,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    article.author ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.caption,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  getDateFormatter(article.date ?? ''),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.caption,
                ),
              ],
            ),
            const SizedBox(height: 12)
          ],
        ));
  }
}
