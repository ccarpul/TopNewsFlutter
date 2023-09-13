import 'package:top_news_flutter/data/database/news/article_entity.dart';

class Article {
  final String title;
  final String subtitle;
  final String? imageUrl;
  final String? author;
  final String? date;
  String? isSaved;

  Article(
      {required this.title,
      required this.subtitle,
      this.imageUrl,
      this.author,
      this.date,
      this.isSaved});

  Map<String, Object?> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
      'author': author,
      'date': date,
      'isSaved': isSaved
    };
  }

  ArticleDataBaseEntity toArticleDataBaseEntity() =>
     ArticleDataBaseEntity(title: title, subtitle: subtitle, imageUrl: imageUrl, author: author, date: date, isSaved: isSaved);
}
