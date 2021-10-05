import 'dart:async';

import 'package:educosin/src/pages/selectGrade.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final versionName = "Versión 1.0.0  |  Todos los derechos reservados 2022 Ⓡ";
  final splashDelay = 5;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Container(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    Image(
                      height: 250,
                      width: 250,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      versionName,
                      style: TextStyle(
                        color: Theme.of(context).highlightColor,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => SelectGrade()));
  }
}
