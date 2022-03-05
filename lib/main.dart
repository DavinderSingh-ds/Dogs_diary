import 'dart:async';
import 'dart:developer';
import 'package:dog_app/Screens/LoginScreen.dart';
import 'package:dog_app/Database/Database.dart';
import 'package:dog_app/Screens/MyHomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'Provider/LocaleProvider.dart';
import 'Widgets/Language_picker_widget.dart';
import 'l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarDividerColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Dogs_Diary',
            theme: ThemeData(
              scaffoldBackgroundColor: Color.fromARGB(255, 53, 135, 243),
              primaryColor: Colors.amber,
            ),
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            home: SplashhScreen(),
          );
        },
      );
}

class SplashhScreen extends StatefulWidget {
  const SplashhScreen({Key? key}) : super(key: key);

  @override
  _SplashhScreenState createState() => _SplashhScreenState();
}

class _SplashhScreenState extends State<SplashhScreen> {
  var _databaseprovider;

  @override
  void initState() {
    super.initState();
    _databaseprovider = Databaseprovider.instance;
    Timer(
      Duration(seconds: 2),
      () => autoLogin(),
    );
  }

  void autoLogin() async {
    var currentUser = await _databaseprovider.checkCurrentSession();
    log('curent user: $currentUser');
    if (currentUser != Null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MyHomePage(title: 'Dogs_Diary'),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          LanguagePickerWidget(),
          const SizedBox(width: 12),
        ],
      ),
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
                  AppLocalizations.of(context)!.hello('Davinder Singh'),
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
                  'Loading Please Wait...',
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
