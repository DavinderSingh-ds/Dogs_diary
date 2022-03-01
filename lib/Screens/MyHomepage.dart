import 'package:dog_app/Screens/Chatting.dart';
import 'package:dog_app/Screens/Dashboard.dart';
import 'package:dog_app/Screens/Feeds.dart';
import 'package:dog_app/Screens/AvailableDogs.dart';
import 'package:dog_app/Screens/Profile.dart';
import 'package:flutter/material.dart';
import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required String title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  late Widget _selectedWidget;

  @override
  void initState() {
    _selectedWidget = const Dashboard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diamond Bottom Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Dogs Diary 🐩",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          backgroundColor: Colors.grey[100],
          elevation: 0.0,
        ),
        body: _selectedWidget,
        bottomNavigationBar: DiamondBottomNavigation(
          itemIcons: const [
            Icons.home,
            Icons.pets_outlined,
            Icons.message,
            Icons.quick_contacts_mail_rounded,
          ],
          centerIcon: Icons.now_widgets_sharp,
          selectedIndex: _selectedIndex,
          onItemPressed: onPressed,
        ),
      ),
    );
  }

  void onPressed(index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _selectedWidget = const Dashboard();
      } else if (index == 1) {
        _selectedWidget = const AvailableDogs();
      } else if (index == 2) {
        _selectedWidget = const Feeds();
      } else if (index == 3) {
        _selectedWidget = const MessageBox();
      } else if (index == 4) {
        _selectedWidget = const Profile();
      }
    });
  }
}
