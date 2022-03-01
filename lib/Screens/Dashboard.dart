import 'dart:developer';

import 'package:dog_app/Database/Database.dart';
import 'package:dog_app/Database/DogsTable.dart';
import 'package:dog_app/Themes/ThemeColors.dart';
import 'package:flutter/material.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'EnterDetail.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var _databaseprovider;
  late Future<List<DogModel>> expenseTransactionsList;
  late Future<List<DogModel>> transactionsList;
  var totalIncome;
  var totalExpense;

  void initState() {
    super.initState();
    _databaseprovider = Databaseprovider.instance;
    refreshData();
  }

  refreshData() {
    setState(() {
      getTransactions();
    });
  }

  getTransactions() {
    setState(() {
      transactionsList = _databaseprovider.getAllTransactions();
      log('Data from categoryList $transactionsList');
    });
  }

  var size, width, height, oreintation;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    oreintation = MediaQuery.of(context).orientation;

    print('Size of Screen is $size');
    print('Width of Screen is $width');
    print('Height of Screen is $height');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: ThemeColors.kLightGreen,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF0598),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.greenAccent,
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 2.0,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(0.0, 0.0),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                      ),
                      width: 300,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          child: Text(
                            '👀 See Available Dogs 🐕',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 460,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FutureBuilder(
                          future: transactionsList,
                          builder: (BuildContext context,
                              AsyncSnapshot<List<DogModel>> snapshot) {
                            if (snapshot.hasData) {
                              print(
                                  'Length of transaction $snapshot.data?.length');
                              return ListView.builder(
                                itemCount: snapshot.data?.length,
                                itemBuilder: (BuildContext context, int index) {
                                  DogModel dogModel = snapshot.data![index];

                                  return Card(
                                    elevation: 0.8,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 6,
                                            right: 6,
                                            bottom: 1,
                                            top: 8,
                                          ),
                                          child: Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 210,
                                                  child: Text(
                                                    'Dog Name : ${dogModel.dogName}',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7.0, top: 2),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 220,
                                                child: Text(
                                                  'Dog Breed  : ${dogModel.dogBreed}',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                'Dog Age : ${dogModel.dogAge}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7.0, top: 2),
                                          child: Row(
                                            children: [
                                              Text(
                                                'Dog Color   : ${dogModel.dogColor}',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 7,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 3),
                                              child: Container(
                                                width: 300,
                                                child: Text(
                                                  dogModel.date,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8,
                                              right: 10,
                                              bottom: 6,
                                              top: 5),
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 25,
                                                  width: 100,
                                                  child: MaterialButton(
                                                    color: Colors.grey[200],
                                                    onPressed: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              EnterDetail(
                                                            title:
                                                                'Update Category',
                                                            newexpenseModel:
                                                                dogModel,
                                                            buttonName:
                                                                'Update',
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.update,
                                                      color: Colors.blue,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: 25,
                                                  width: 100,
                                                  child: MaterialButton(
                                                    color: Colors.grey[200],
                                                    onPressed: () {
                                                      _databaseprovider
                                                          .deleteTransaction(
                                                              dogModel.id);
                                                      refreshData();
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                              'Category Deleted'),
                                                          duration: Duration(
                                                              seconds: 1),
                                                        ),
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Please Wait.....'),
                                    SizedBox(height: 30),
                                    CircularProgressIndicator(),
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 75,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.cyanAccent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          MaterialButton(
                            height: 42,
                            minWidth: 280,
                            color: Colors.amber,
                            child: Text(
                              'Add Dog Detail',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EnterDetail(title: ''),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        child: Icon(Icons.add),
        closedForegroundColor: Colors.black,
        openForegroundColor: Colors.white,
        closedBackgroundColor: Colors.white,
        openBackgroundColor: Colors.black,
        speedDialChildren: <SpeedDialChild>[
          SpeedDialChild(
            child: Icon(Icons.directions_run),
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            label: 'Let\'s Fun!',
            onPressed: () {},
            closeSpeedDialOnPressed: false,
          ),
          SpeedDialChild(
            child: Icon(Icons.directions_walk),
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
            label: 'Let\'s go for a walk!',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
