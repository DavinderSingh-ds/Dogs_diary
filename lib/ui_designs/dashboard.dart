import 'dart:developer';

import 'package:dog_app/database/database.dart';
import 'package:dog_app/model/dog_table.dart';
import 'package:dog_app/theme/light_colors.dart';
import 'package:flutter/material.dart';
import 'enter_detail.dart';

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
                color: LightColors.kLightGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(88),
                ),
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
                              fontSize: 23,
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
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueAccent,
                              Color(0xffF0580),
                            ],
                          ),
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
                                                      fontFamily:
                                                          'Times New Roman',
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
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        'Times New Roman',
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
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Times New Roman',
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
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontFamily:
                                                        'Times New Roman',
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
                    height: 4,
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
                  color: Colors.white,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.purpleAccent,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 38,
                        width: 240,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.cyan,
                              Colors.indigoAccent,
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 1,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        child: MaterialButton(
                          child: Text(
                            'Add Dog Detail',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                    offset: Offset(2, 2),
                                    color: Colors.deepPurple),
                              ],
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
