import 'dart:developer';
import 'dart:io';

import 'package:dog_app/Database/DogsTable.dart';
import 'package:dog_app/Database/SessionTable.dart';
import 'package:dog_app/Database/UsersTable.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databaseprovider {
  static final _databaseName = "dogdatabase.db";
  static final _databaseVersion = 1;

  static final usersTable = 'authentication';
  static final userId = 'id';
  static final userName = 'name';
  static final userEmail = 'email';
  static final userPassword = 'passwrd';
  static final cnfPassword = 'cnfpsswrd';

  static final sessionTable = 'autoLogin';
  static final autoId = 'id';
  static final autoName = 'name';
  static final autoEmail = 'email';
  static final autoPassword = 'passwrd';
  static final autocnfPassword = 'cnfpsswrd';

  static final dogTable = 'transactions';
  static final dogId = 'id';
  static final dogName = 'transactioncategorytype';
  static final buyDate = 'date';
  static final dogAge = 'amount';
  static final dogBreed = 'description';
  static final dogColor = 'transactionType';

  Databaseprovider._privateconstructor();
  static final Databaseprovider instance =
      Databaseprovider._privateconstructor();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _oncreate);
  }

  Future _oncreate(Database db, int version) async {
    await db.execute("CREATE TABLE $dogTable("
        "$dogId INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "$dogName TEXT ,"
        "$buyDate TEXT ,"
        "$dogAge TEXT ,"
        "$dogBreed TEXT ,"
        "$dogColor TEXT "
        ")");

    await db.execute("CREATE TABLE $usersTable("
        "$userId INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "$userName TEXT ,"
        "$userEmail TEXT ,"
        "$userPassword TEXT ,"
        "$cnfPassword TEXT "
        ")");

    await db.execute("CREATE TABLE $sessionTable("
        "$autoId INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "$autoName TEXT ,"
        "$autoEmail TEXT ,"
        "$autoPassword TEXT ,"
        "$autocnfPassword TEXT "
        ")");
  }

  addTransaction(DogModel transactionModel) async {
    Database newdb = await instance.database;
    return await newdb.insert(
      '$dogTable',
      transactionModel.todatabaseJson(),
    );
  }

  addSignUpdetail(UsersModel signupdetailModel) async {
    Database adddetaildb = await instance.database;
    return await adddetaildb.insert(
      '$usersTable',
      signupdetailModel.todatabaseJson(),
    );
  }

  addSessionDetails(SessionModel autoLogin) async {
    Database adddetaildb = await instance.database;
    return await adddetaildb.insert(
      '$sessionTable',
      autoLogin.todatabaseJson(),
    );
  }

  Future<Object> getUserByEmailAndPassword(
      String email, String password) async {
    final db = await database;
    var users = await db.query(usersTable,
        where: "email = ? AND passwrd = ?", whereArgs: [email, password]);
    log('users are: $users');
    return users.isNotEmpty ? users.first : Null;
  }

  Future<Object> getUserByEmail(String email) async {
    final db = await database;
    var users =
        await db.query(usersTable, where: "email = ? ", whereArgs: [email]);
    log('users are: $users');
    return users.isNotEmpty ? users.first : Null;
  }

  Future<Object> checkCurrentSession() async {
    final db = await database;
    await db.execute("CREATE TABLE IF NOT EXISTS $sessionTable("
        "$autoId INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "$autoName TEXT ,"
        "$autoEmail TEXT ,"
        "$autoPassword TEXT ,"
        "$autocnfPassword TEXT "
        ")");
    var users = await db.query(sessionTable);
    log('users are: $users');
    return users.isNotEmpty ? users.first : Null;
  }

  Future<List<UsersModel>> getAllsignUpdetail() async {
    final signupdb = await instance.database;
    final List<Map<String, Object?>> signUpallData =
        await signupdb.query('$usersTable');
    return signUpallData.map((e) => UsersModel.fromdatabaseJson(e)).toList();
  }

  Future<List<SessionModel>> getAllSessionDetail() async {
    final autodb = await instance.database;
    final List<Map<String, Object?>> allSessionData =
        await autodb.query('$sessionTable');
    return allSessionData.map((e) => SessionModel.fromdatabaseJson(e)).toList();
  }

  Future<List<DogModel>> getAllTransactions() async {
    final db = await instance.database;
    final List<Map<String, Object?>> newallData = await db.query('$dogTable');
    print('Transactions $dogTable');
    return newallData.map((e) => DogModel.fromdatabaseJson(e)).toList();
  }

  Future<void> deleteTransaction(int? id) async {
    final newdb = await instance.database;
    await newdb.delete(
      '$dogTable',
      where: "$dogId = ?",
      whereArgs: [id],
    );
  }

  Future<void> clearSession() async {
    final newdb = await instance.database;
    await newdb.delete(
      '$sessionTable',
    );
  }

  updateTransaction(DogModel transactionModel) async {
    final newdb = await database;
    var result = await newdb.update(
        "$dogTable", transactionModel.todatabaseJson(),
        where: "$dogId = ?", whereArgs: [transactionModel.id]);
    return result;
  }
}
