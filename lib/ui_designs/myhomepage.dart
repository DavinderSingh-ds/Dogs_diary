import 'package:dog_app/authentication.dart/loginScreen.dart';
import 'package:dog_app/ui_designs/dashboard.dart';
import 'package:dog_app/ui_designs/feeds.dart';
import 'package:dog_app/ui_designs/transactions.dart';
import 'package:flutter/material.dart';

import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';

import 'categories.dart';

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
          backgroundColor: Colors.grey[100],
          elevation: 0.0,
        ),
        body: _selectedWidget,
        bottomNavigationBar: DiamondBottomNavigation(
          itemIcons: const [
            Icons.home,
            Icons.notifications,
            Icons.message,
            Icons.account_box,
          ],
          centerIcon: Icons.place,
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
        _selectedWidget = const Transactions();
      } else if (index == 2) {
        _selectedWidget = const Feeds();
      } else if (index == 3) {
        _selectedWidget = const Categories();
      }
    });
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Home Screen"));
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Notification Screen"));
  }
}

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Location Screen"));
  }
}

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Messages Screen"));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile Screen"));
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   int _selectedIndex = 0;
//   static const List<Widget> _widgetoptions = <Widget>[
//     Dashboard(),
//     Transactions(),
//     Categories(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      // resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text(
      //     "Dogs Diary 🐩",
      //     style: TextStyle(
      //       fontSize: 26,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.deepPurple,
      //     ),
      //   ),
      //   leading: InkWell(
      //     onTap: () => Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => LoginScreen(),
      //     )),
      //     child: Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      // ),
//       body: Center(
//         child: _widgetoptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//           backgroundColor: Colors.blueAccent,
//           height: 58,
//           color: Colors.white,
//           buttonBackgroundColor: Colors.white,
//           animationCurve: Curves.easeInOut,
//           animationDuration: Duration(milliseconds: 600),
//           items: <Widget>[
//             Icon(Icons.home, size: 28),
//             Icon(Icons.pets, size: 28),
//             Icon(Icons.perm_phone_msg_rounded, size: 28),
//           ],
//           onTap: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           }),
//     );
//   }
// }
