import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dog_app/authentication.dart/loginScreen.dart';
import 'package:dog_app/ui_designs/dashboard.dart';
import 'package:dog_app/ui_designs/transactions.dart';
import 'package:flutter/material.dart';

import 'categories.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetoptions = <Widget>[
    Dashboard(),
    Transactions(),
    Categories(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Dogs Diary 🐩",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        leading: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => LoginScreen(),
          )),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: _widgetoptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          height: 58,
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          items: <Widget>[
            Icon(Icons.home, size: 28),
            Icon(Icons.pets, size: 28),
            Icon(Icons.perm_phone_msg_rounded, size: 28),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
    );
  }
}
