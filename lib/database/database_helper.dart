import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sample/database/saved_account.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
 
  factory DatabaseHelper() => _instance;
 
  final String tableAccount = 'Account';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnEmail = 'email';
  final String columnClass = 'class';
  final String columnPhone = 'phone'; 

  static Database _db;
 
  DatabaseHelper.internal();
 
  Future<Database> get db async {
    if (_db == null) {
      _db = await initDb();
    }
    return _db;
  }
 
  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'devspace.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
 
  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE IF NOT EXISTS $tableAccount($columnId INTEGER PRIMARY KEY, $columnName TEXT, $columnEmail TEXT, $columnClass TEXT, $columnPhone INTEGER)'
    );
  }

  void onUpgrade(Database db,int oldVersion,int newVersion){
    db.execute("DROP TABLE IF EXISTS $tableAccount");
  }
 
  Future<int> saveAccount(Account account) async {
    var dbClient = await db;
    var result = await dbClient.insert(tableAccount,account.toMap());
    return result;
  }
 
  Future<List> getAccount() async {
    var dbClient = await db;
    //var result = await dbClient.query(tableHistory, columns: [columnIdH, columnDay ,columnMonth, columnYear, columnSum]);
    var result = await dbClient.rawQuery('SELECT * FROM $tableAccount');
    return result.toList();
  }
 
  Future<int> getCountAccount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(await dbClient.rawQuery('SELECT COUNT(*) as logged FROM $tableAccount'));
  }
  
  Future<int> deleteAccount(int id) async {
    var dbClient = await db;
    return await dbClient.delete(tableAccount, where: '$columnId = ?', whereArgs: [id]);
//    return await dbClient.rawDelete('DELETE FROM $tableNote WHERE $columnId = $id');
  }
  
  Future<int> updateAccount(Account account) async {
    var dbClient = await db;
    return await dbClient.update(tableAccount, account.toMap(), where: "$columnId = ?", whereArgs: [account.id]);
  }
  
  Future close() async {
    var dbClient = await db;
    return dbClient.close();
  }
}