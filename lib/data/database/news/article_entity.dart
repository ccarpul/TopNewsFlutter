import 'package:top_news_flutter/domain/entity/article.dart';

class ArticleDataBaseEntity {

  final String title;
  final String subtitle;
  final String? imageUrl;
  final String? author;
  final String? date;
  final String? isSaved;

  ArticleDataBaseEntity({
      required this.title,
      required this.subtitle,
      this.imageUrl,
      this.author,
      this.date,
      this.isSaved
    });

  ArticleDataBaseEntity.fromMap(Map<String, dynamic> article): 
    title = article['title'],
    subtitle = article['subtitle'],
    imageUrl = article['imageUrl'],
    author = article['author'],
    date = article['date'],
    isSaved = article['isSaved'];


  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'imageUrl': imageUrl,
      'author': author,
      'date': date,
      'isSaved': isSaved
    };
  }

  Article toArticle() =>
     Article(title: title, subtitle: subtitle, imageUrl: imageUrl, author: author, date: date, isSaved: isSaved);


   @override
  String toString() {
    return 'Article{title: $title, subtitle: $subtitle, imageUrl: $imageUrl, author: $author, date: $date, isSaved: $isSaved}';
  }
}