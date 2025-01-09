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
  static const _databaseVersion = 1;

  static const _tableName = 'lifespan';
  static const _columnId = 'id';
  static const _columnBirthDate = 'birthDate';
  static const _columnDeathDate = 'deathDate';

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
            $_columnBirthDate TEXT,
            $_columnDeathDate TEXT
          )
        ''');

          // Insert a lifespan record that has a null birth date and death date
          await db.insert(
            _tableName,
            {
              _columnBirthDate: null,
              _columnDeathDate: null,
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
}
