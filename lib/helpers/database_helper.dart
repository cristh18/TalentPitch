import 'dart:async';

import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../data/datasources/local/entities/video_entity.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static const String _databaseName = 'TalentPitch.db';
  static const int _databaseVersion = 1;

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final String path = join(await getDatabasesPath(), _databaseName);
    return openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE playlist (
        id INTEGER PRIMARY KEY,
        name TEXT,
        description TEXT,
        created_at TEXT,
        updated_at TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE video (
        id INTEGER PRIMARY KEY,
        playlist_id INTEGER,
        url TEXT,
        created_at TEXT,
        updated_at TEXT,
        FOREIGN KEY (playlist_id) REFERENCES playlist(id)
      )
    ''');
  }

  Future<int> insert(String table, Map<String, Object?> data) async {
    final Database db = await instance.database;
    try {
      return await db.insert(table, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (e) {
      final Logger logger = Logger();
      logger.e(e);
      return -1;
    }
  }

  // Future<int> insert(VideoEntity videoEntity) async {
  //   final Database db = await instance.database;
  //   try {
  //     return await db.insert('video', videoEntity.toMap(),
  //         conflictAlgorithm: ConflictAlgorithm.replace);
  //   } catch (e) {
  //     final Logger logger = Logger();
  //     logger.e(e);
  //     return -1;
  //   }
  // }

  // Future<List<VideoEntity>> getVideos() async {
  //   final Database db = await instance.database;
  //   final List<Map<String, Object?>> maps = await db.query('video');
  //   return List<VideoEntity>.generate(maps.length, (int index) {
  //     return VideoEntity(
  //       id: maps[index]['id'] as int,
  //       playlistId: maps[index]['playlist_id'] as int,
  //       url: maps[index]['url'] as String,
  //       createdAt: DateTime.parse(maps[index]['created_at'] as String),
  //       updatedAt: DateTime.parse(maps[index]['updated_at'] as String),
  //     );
  //   });
  // }
}
