import 'dart:developer';
import 'dart:io';

import 'package:dog_app/model/autoLoginmodel.dart';
import 'package:dog_app/model/dog_table.dart';
import 'package:dog_app/model/signup_table.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databaseprovider {
  static final _databaseName = "dogdatabase.db";
  static final _databaseVersion = 1;

  static final signUpTable = 'authentication';
  static final userId = 'id';
  static final userName = 'name';
  static final userEmail = 'email';
  static final userPassword = 'passwrd';
  static final cnfPassword = 'cnfpsswrd';

  static final autoLoginTable = 'autoLogin';
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

    await db.execute("CREATE TABLE $signUpTable("
        "$userId INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "$userName TEXT ,"
        "$userEmail TEXT ,"
        "$userPassword TEXT ,"
        "$cnfPassword TEXT "
        ")");

    await db.execute("CREATE TABLE $autoLoginTable("
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

  addSignUpdetail(signUpModel signupdetailModel) async {
    Database adddetaildb = await instance.database;
    return await adddetaildb.insert(
      '$signUpTable',
      signupdetailModel.todatabaseJson(),
    );
  }

  // ignore: non_constant_identifier_names
  addSignUpdetail_forAuto(autoLoginModel autoLogin) async {
    Database adddetaildb = await instance.database;
    return await adddetaildb.insert(
      '$autoLoginTable',
      autoLogin.todatabaseJson(),
    );
  }

  Future<Object> getUserByEmailAndPassword(
      String email, String password) async {
    final db = await database;
    var users = await db.query(signUpTable,
        where: "email = ? AND passwrd = ?", whereArgs: [email, password]);
    log('users are: $users');
    return users.isNotEmpty ? users.first : Null;
  }

  Future<Object> getUserByEmail(String email) async {
    final db = await database;
    var users =
        await db.query(signUpTable, where: "email = ? ", whereArgs: [email]);
    log('users are: $users');
    return users.isNotEmpty ? users.first : Null;
  }

  Future<List<signUpModel>> getAllsignUpdetail() async {
    final signupdb = await instance.database;
    final List<Map<String, Object?>> signUpallData =
        await signupdb.query('$signUpTable');
    return signUpallData.map((e) => signUpModel.fromdatabaseJson(e)).toList();
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

  updateTransaction(DogModel transactionModel) async {
    final newdb = await database;
    var result = await newdb.update(
        "$dogTable", transactionModel.todatabaseJson(),
        where: "$dogId = ?", whereArgs: [transactionModel.id]);
    return result;
  }
}
