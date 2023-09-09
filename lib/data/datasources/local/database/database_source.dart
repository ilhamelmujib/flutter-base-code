import 'dart:async';

import 'package:sqflite/sqflite.dart';

class DatabaseSource {
  static DatabaseSource? _databaseSource;

  DatabaseSource._instance() {
    _databaseSource = this;
  }

  factory DatabaseSource() => _databaseSource ?? DatabaseSource._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String tblTask = 'task';
  static const String tblNotes = 'notes';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/hatam.db';

    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $tblTask (
        id INTEGER PRIMARY KEY,
        userId text,
        title TEXT,
        notes TEXT,
        time DATETIME,
        repetition INTEGER,  
        status INTEGER,  
        createdAt TEXT,
        updatedAt TEXT
      );
    ''');

    await db.execute('''
      CREATE TABLE  $tblNotes (
        id INTEGER PRIMARY KEY,
        userId text,
        text TEXT,
        isFavorite INTEGER,
        createdAt TEXT,
        updatedAt TEXT
      );
    ''');
  }
}
