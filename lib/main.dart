import 'dart:async';

import 'package:dog_app/authentication.dart/loginscreen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:progress_indicators/progress_indicators.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dog_App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashhScreen(),
    );
  }
}

class SplashhScreen extends StatefulWidget {
  const SplashhScreen({Key? key}) : super(key: key);

  @override
  _SplashhScreenState createState() => _SplashhScreenState();
}

class _SplashhScreenState extends State<SplashhScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: new AssetImage("images/new3.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Times New Roman',
                    fontSize: 55.0,
                    shadows: [
                      Shadow(
                        blurRadius: 2,
                        offset: Offset(5, 5),
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                CollectionScaleTransition(
                  children: <Widget>[
                    Icon(Icons.pets, color: Colors.white),
                    SizedBox(width: 3),
                    Icon(Icons.workspaces_outline, color: Colors.white),
                    SizedBox(width: 3),
                    Icon(Icons.pets, color: Colors.white),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                ScalingText(
                  'Loading Please Wait....',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Times New Roman',
                    fontSize: 25.0,
                    shadows: [
                      Shadow(
                        blurRadius: 2,
                        offset: Offset(3, 2),
                        color: Colors.blueAccent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
