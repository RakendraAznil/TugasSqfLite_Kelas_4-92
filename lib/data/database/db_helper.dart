import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DbHelper {
  static const _dbName = 'Barang.db';
  static const tableName = "nama";

  static const _dbVersion = 2;

  static const _createTable =
      '''
    CREATE TABLE $tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)
  ''';

  Database? _db;

  Future<Database> get database async => _db ??= await _open();

  Future<Database> _open() async {
    final dir = await getDatabasesPath();

    return openDatabase(
      '$dir/$_dbName',
      version: _dbVersion,

      onCreate: (db, version) async {
        await db.execute(_createTable);
      },
    );
  }
}
