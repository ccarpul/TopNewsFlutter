import 'package:sqflite/sqflite.dart';
import 'package:top_news_flutter/data/database/database_service.dart';
import 'package:top_news_flutter/data/database/news/article_entity.dart';

import '../../domain/entity/article.dart';

class ArticleDB {
  static const tableSaved = 'saved';
  static const tableNameOffline = 'offline_first';

  static Future<void> createTable(
      Database database, int version, String tableName) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
      title TEXT PRIMARY KEY,
      subtitle TEXT,
      imageUrl TEXT,
      author TEXT,
      date TEXT,
      isSaved TEXT
      );""");
  }

  Future<int> create(String tableName,
      {required String title,
      required String subtitle,
      String imageUrl = '',
      String author = '',
      String date = '',
      String isSaved = ''}) async {
    final database = await DatabaseService.database;
    return await database.rawInsert(
        'INSERT INTO $tableName (title, subtitle, imageUrl, author, date, isSaved) VALUES (?, ?, ?, ?, ?, ?) ON CONFLICT (title) DO NOTHING',
        [title, subtitle, imageUrl, author, date, isSaved]);
  }

  Future<int> createFromList(
    String tableName, List<ArticleDataBaseEntity> newArticles) async {
    final database = await DatabaseService.database;
    final Batch batch = database.batch();

    for (ArticleDataBaseEntity article in newArticles) {
      batch.insert(tableName, article.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }

    final List<dynamic> result = await batch.commit();
    final int affectedRows = result.reduce((sum, element) => sum + element);
    return affectedRows;
  }

  Future<List<Article>> fetchAll(String tableName) async {
    final database = await DatabaseService.database;
    final articles = await database.rawQuery('SELECT * from $tableName');
    return articles
        .map((article) => ArticleDataBaseEntity.fromMap(article).toArticle())
        .toList();
  }

  Future<int> update(
      {required String title,
      required String isSaved,
      required String tableName}) async {
    final database = await DatabaseService.database;
    return await database.update(
        tableName,
        {
          'isSaved': isSaved,
        },
        where: 'title = ?',
        conflictAlgorithm: ConflictAlgorithm.rollback,
        whereArgs: [title]);
  }

  Future<void> delete(String title, String tableName) async {
    final database = await DatabaseService.database;
    await database.rawDelete('''DELETE FROM $tableName WHERE title = ?''', [title]);
  }
}
