import 'package:colon/views/homepage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Colon Books',
      theme: ThemeData(

        primarySwatch: Colors.cyan,
        backgroundColor: Colors.white,
      ),
      home: SplashScreenPage(),
    );
  }
}
class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4), () async {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Align(
        alignment: Alignment.center,
        child: _splashImageUI(),

      ),
    );
  }

  Widget _splashImageUI() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                  "assets/images/colon_splash_screen.png",
                  width:250,
                  height: 380)
          ),
        ],

      ),
    );
  }

}
