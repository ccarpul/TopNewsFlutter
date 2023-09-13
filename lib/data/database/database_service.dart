import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:top_news_flutter/data/database/article_db.dart';

class DatabaseService {
  static const String databaseName = "article_database.db";
  static Database? _db;

  static Future<Database> get database async {
    return _db ?? await _initialize();
  }

  static Future<String> get _fullPath async {
    final path = await getDatabasesPath();
    return join(path, databaseName);
  }

  static Future<Database> _initialize() async {
    final path = await _fullPath;
    var database = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return database;
  }

  static Future<void> create(Database database, int version) async {
    await ArticleDB.createTable(database, version, ArticleDB.tableSaved);
    await ArticleDB.createTable(database, version, ArticleDB.tableNameOffline);
  }
}
