import 'dart:async';

import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../data/datasources/local/entities/playlist_entity.dart';
import '../data/datasources/local/entities/video_entity.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static const String _databaseName = 'TalentPitch.db';
  static const int _databaseVersion = 1;

  final Logger logger = Logger();

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

  Future<List<PlaylistEntity>> getPlaylists() async {
    final Database db = await instance.database;
    final List<Map<String, Object?>> results = await db.query('playlist');
    return List<PlaylistEntity>.generate(results.length, (int index) {
      return PlaylistEntity(
        id: results[index]['id']! as int,
        name: results[index]['name']! as String,
        description: results[index]['description']! as String,
        createdAt: DateTime.parse(results[index]['created_at']! as String),
        updatedAt: DateTime.parse(results[index]['updated_at']! as String),
      );
    });
  }

  Future<int> insert(String table, Map<String, Object?> data) async {
    try {
      final Database db = await instance.database;
      return await db.insert(table, data,
          conflictAlgorithm: ConflictAlgorithm.abort);
    } catch (e) {
      logger.e('Error inserting data: $e');
      return -1;
    }
  }

  Future<List<VideoEntity>> getVideos() async {
    final Database db = await instance.database;
    final List<Map<String, Object?>> results = await db.query('video');
    return List<VideoEntity>.generate(results.length, (int index) {
      return VideoEntity(
        id: results[index]['id']! as int,
        playlistId: results[index]['playlist_id']! as int,
        url: results[index]['url']! as String,
        createdAt: DateTime.parse(results[index]['created_at']! as String),
        updatedAt: DateTime.parse(results[index]['updated_at']! as String),
      );
    });
  }

  Future<List<VideoEntity>> getVideosByPlaylistId(int playlistId) async {
    final Database db = await instance.database;
    final List<Map<String, Object?>> results = await db.query('video',
        where: 'playlist_id = ?', whereArgs: <int>[playlistId]);
    return List<VideoEntity>.generate(results.length, (int index) {
      return VideoEntity(
        id: results[index]['id']! as int,
        playlistId: results[index]['playlist_id']! as int,
        url: results[index]['url']! as String,
        createdAt: DateTime.parse(results[index]['created_at']! as String),
        updatedAt: DateTime.parse(results[index]['updated_at']! as String),
      );
    });
  }

  Future<int> delete(String table, int id) async {
    final Database db = await instance.database;
    return db.delete(table, where: 'id = ?', whereArgs: <int>[id]);
  }
}
