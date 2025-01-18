import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// A class that initializes the local database.
class LocalDatabase {
  /// Returns the instance of the local database.
  factory LocalDatabase() => _instance;
  LocalDatabase._internal();
  static final _instance = LocalDatabase._internal();

  static const _databaseName = 'app_database.db';
  static const _databaseVersion = 3;

  static const _tableName = 'lifespan';
  static const _columnId = 'id';
  static const _columnBirthDate = 'birthDate';
  static const _columnDeathDate = 'deathDate';
  static const _columnThemeMode = 'themeMode';
  static const _columnIsInitialUser = 'isInitialUser';

  Database? _database;

  /// Returns the database.
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  /// Initializes the database.
  Future<Database> _initDatabase() async {
    try {
      final dbPath = await getDatabasesPath();
      if (kDebugMode) {
        print('dbPath: $dbPath');
      }
      final path = join(dbPath, _databaseName);

      return openDatabase(
        path,
        version: _databaseVersion,
        onCreate: (db, _) async {
          await db.execute('''
          CREATE TABLE $_tableName (
            $_columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $_columnBirthDate TEXT NOT NULL,
            $_columnDeathDate TEXT NOT NULL,
            $_columnThemeMode TEXT NOT NULL,
            $_columnIsInitialUser INTEGER NOT NULL
          )
        ''');

          // Insert a lifespan record
          await db.insert(
            _tableName,
            {
              _columnBirthDate: '2000-01-01T00:00:00.000',
              _columnDeathDate: '2100-01-01T00:00:00.000',
              _columnThemeMode: 'system',
              _columnIsInitialUser: 1,
            },
          );
        },
      );
    } catch (e) {
      throw Exception('Failed to initialize the database $e');
    }
  }

  /// Closes the database.
  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database!.close();
    }
  }

  /// Deletes the database.
  Future<void> clearDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    await deleteDatabase(path);
  }
}
