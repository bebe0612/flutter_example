import 'dart:developer';

import 'package:sqflite/sqflite.dart';

typedef Json = Map<String, dynamic>;

class DatabaseHelper {
  factory DatabaseHelper() => _instance;
  static final DatabaseHelper _instance = DatabaseHelper._singleton();
  DatabaseHelper._singleton();

  static final _databaseName = 'todo.db';
  static final _databaseVersion = 1;
  static final _tableName = 'todo';

  late Database database;
  init() async {
    database = await openDatabase(
      _databaseName,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableName (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        subTitle TEXT NOT NULL,
        date TEXT NOT NULL
      )
      ''');
  }

  Future<int> insert(Json json) async {
    return await database.insert(_tableName, json);
  }

  Future<List<Json>> selectAll() async {
    log('SELECT * FROM $_tableName');
    return await database.query(_tableName);
  }

  Future<Json> selectById(int id) async {
    log('SELECT * FROM $_tableName WHERE id = $id');
    return (await database.query(_tableName, where: 'id = $id'))[0];
  }

  Future<int> delete(int id) async {
    log('DELETE * FROM $_tableName WHERE id = $id');
    return await database.delete(_tableName, where: 'id = $id');
  }

  Future<int> update(int id, Json json) async {
    log('SELECT * FROM $_tableName WHERE id = $id UPDATE $json');
    return await database.update(_tableName, json, where: 'id = $id');
  }
}
