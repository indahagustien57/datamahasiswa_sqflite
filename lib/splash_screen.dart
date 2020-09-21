import 'dart:async';

import 'package:datamahasiswa_sqflite/page_login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("images/splash.png"),
          fit: BoxFit.cover,
        )),
      )),
    );
  }

  Future<Timer> startTimer() async {
    return Timer(Duration(seconds: 5), onDone);
  }

  void onDone() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => PageLogin()));
  }
}
