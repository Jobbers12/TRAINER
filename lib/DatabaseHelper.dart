import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = 'trainer.db';
  static final _databaseVersion = 1;

  static final table = 'users';

  static final columnUserID = '_id';
  static final columnUserName = 'name';
  static final columnUserAge = 'age';
  static final columnUserWeight = 'weight';
  static final columnUserGender = 'gender';
  static final columnUserGoals = 'goals';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    // Initialise db on first access
    _database = await _initDatabase();
    return _database;
  }

  // Open db (and create if it doesnt exist)
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  //TODO: DB takes an int for userID, but model takes a String! Will be problem when UUID is implimented

  // Create the db table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnUserID INTEGER PRIMARY KEY,
            $columnUserName TEXT NOT NULL,
            $columnUserAge INTEGER NOT NULL,
            $columnUserWeight DOUBLE NOT NULL,
            $columnUserGender TEXT NOT NULL,
            $columnUserGoals TEXT NOT NULL,
          )
          ''');
  }

  // **** HELPER METHODS ****

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnUserID];
    return await db
        .update(table, row, where: '$columnUserID = ?', whereArgs: [id]);
  }
  
  // Deletes the row specified by the id. The number of affected rows is 
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnUserID = ?', whereArgs: [id]);
  }
}
