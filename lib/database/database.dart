import 'dart:io';

import 'package:dog_app/model/dog_table.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databaseprovider {
  static final _databaseName = "dogdatabase.db";
  static final _databaseVersion = 1;

  //Fields for Dog Table
  static final dogTable = 'transactions';
  static final dogId = 'id';
  static final dogName = 'transactioncategorytype';
  static final buyDate = 'date';
  static final dogAge = 'amount';
  static final dogBreed = 'description';
  static final dogColor = 'transactionType';

  // make this a singleton class
  Databaseprovider._privateconstructor();
  static final Databaseprovider instance =
      Databaseprovider._privateconstructor();
  // only have a single app-wide referance to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    // lazily instatiate the db the first time it is accesed
    _database = await _initDatabase();
    return _database!;
  }

  // this opens the database
  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _oncreate);
  }

  //  SQL CODE to create the database table
  Future _oncreate(Database db, int version) async {
    await db.execute("CREATE TABLE $dogTable("
        "$dogId INTEGER PRIMARY KEY AUTOINCREMENT ,"
        "$dogName TEXT ,"
        "$buyDate TEXT ,"
        "$dogAge TEXT ,"
        "$dogBreed TEXT ,"
        "$dogColor TEXT "
        ")");
  }

//TRANSACTION TABLE ALL CRUD OPERATIONS
  //For inserting the data in the database of Transaction
  addTransaction(DogModel transactionModel) async {
    Database newdb = await instance.database;
    return await newdb.insert(
      '$dogTable',
      transactionModel.todatabaseJson(),
    );
  }

  // Fetch all the data from the Transaction Table to show in the Transaction Page
  Future<List<DogModel>> getAllTransactions() async {
    final db = await instance.database;
    final List<Map<String, Object?>> newallData = await db.query('$dogTable');
    print('Transactions $dogTable');
    return newallData.map((e) => DogModel.fromdatabaseJson(e)).toList();
  }

  //Deleting the Single Transaction Entry from the Transaction Table in the database
  Future<void> deleteTransaction(int? id) async {
    final newdb = await instance.database;
    await newdb.delete(
      '$dogTable',
      where: "$dogId = ?",
      whereArgs: [id],
    );
  }

  //Updating the transaction by ID from the Transaction Table in the database
  updateTransaction(DogModel transactionModel) async {
    final newdb = await database;
    var result = await newdb.update(
        "$dogTable", transactionModel.todatabaseJson(),
        where: "$dogId = ?", whereArgs: [transactionModel.id]);
    return result;
  }

// for transactions by expense
  Future<List<DogModel>> gettransactionbyExpense() async {
    final newdb = await instance.database;
    final List<Map<String, dynamic>> newEData = await newdb.query(
      '$dogTable',
      where: "transactionType = ?",
      whereArgs: ['Expense'],
    );
    List<DogModel> homeData = newEData.isNotEmpty
        ? newEData.map((e) => DogModel.fromdatabaseJson(e)).toList()
        : [];
    print('Date expense of Category $homeData');
    return homeData;
  }
}
