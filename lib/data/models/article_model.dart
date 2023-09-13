import 'package:top_news_flutter/domain/entity/article.dart';

class ArticleModel {
  final String? title;
  final String? subtitle;
  final String? imageUrl;
  final String? author;
  final String? date;

  ArticleModel({
    required this.title,
    required this.subtitle,
    this.imageUrl,
      this.author,
      this.date});

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
      title: json['title'],
      subtitle: json['description'],
      imageUrl: json['urlToImage'],
      author: json['author'],
      date: json['publishedAt']);

  Article toArticleEntity() => Article(
    title: title ?? '',
    subtitle: subtitle ?? '',
    imageUrl: imageUrl,
    author: author,
    date: date
    );
}
