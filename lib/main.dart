import 'package:flutter/material.dart';
import 'package:todo/homeScreen.dart';
import 'dart:async';

void main() {
  runApp(new MaterialApp(
   theme: new ThemeData(
      primaryColor: Colors.white,
      textTheme: new TextTheme(
        body1: new TextStyle(color: Colors.red),
      ),
    ),
  home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/HomeScreen': (BuildContext context) => new HomeScreen(),
    },
  ));
}

class SplashScreen extends StatefulWidget {
  @override 
  _SplashScreenState createState() => new _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }
  void navigationPage() {
  Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

   @override
  Widget build(BuildContext context) {
  return new Scaffold(
    body: new Center(
      child: new Image.asset('assets/logo/mughalcuisine.png'),
    ),
  );
  }
}
