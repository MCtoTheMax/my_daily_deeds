/*
import 'dart:async';
import 'dart:io';
import 'package:my_daily_deeds/models/tasks/tasks.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  /////

  final columnUserName = "userName";

  ////
  final tableUser = "userTable";
  final columnId = 'id';
  final columnPassword = "password";
  final columnName = 'name';
  final columnStreet = 'street';
  final columnPlz = 'plz';
  final columnCity = 'city';

  /////
  final tableStudents = 'studentsTable';
  final columnStudentId = 'id';
  final columnSchoolId = 'schoolId';
  final columnStudentName = 'name';
  final columnStudentLastName = 'lastName';

  /////

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "mainDb.db");

    //await deleteDatabase(path);

    var myDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myDb;
  }

  void deleteTable(String tableName) async {
    var dbClient = await db;
    await dbClient.execute('DROP TABLE $tableName');
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute("CREATE TABLE $tableUser("
        "$columnId INTEGER PRIMARY KEY, "
        "$columnPassword TEXT, "
        "$columnName TEXT, "
        "$columnStreet TEXT, "
        "$columnPlz TEXT, "
        "$columnCity TEXT)");
    await db.execute("CREATE TABLE $tableStudents("
        "$columnStudentId INTEGER PRIMARY KEY, "
        "$columnSchoolId INTEGER, "
        "$columnStudentName TEXT, "
        "$columnStudentLastName TEXT)");




  }

  // CRUD

  // insertion
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert('$tableUser', user.toMap());
    return res;
  }

  // get all entries
  Future<List> getAllUsers() async {
    var dbClient = await db;
    List<Map<String, dynamic>> res =
        await dbClient.rawQuery('SELECT * FROM $tableUser');
    return res;
  }

  // get specific entry
  Future<User> getUserById(int id) async {
    var dbClient = await db;

    List<Map<String, dynamic>> res = await dbClient
        .rawQuery('SELECT * FROM $tableUser WHERE $columnId = $id');
    User user = User.fromMap(res.first);
    return user._id > 0 ? user : null;
  }

  // delete entry
  Future<int> deleteUser(String userName) async {
    var dbClient = await db;
    return dbClient
        .delete(tableUser, where: '$columnUserName = ?', whereArgs: [userName]);
  }

  // delete all entry
  void deleteAllUsers() async {
    var dbClient = await db;
    dbClient.execute('DELETE FROM $tableUser');
  }

  // update entry
  Future<int> updateUser(User user) async {
    var dbClient = await db;
    return await dbClient.update(tableUser, user.toMap(),
        where: '$columnId = "${user._id}"');
  }

  // close db
  Future closeDb() async {
    var dbClient = await db;
    return dbClient.close();
  }
}



*/
