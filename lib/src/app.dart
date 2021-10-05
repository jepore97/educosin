import 'package:educosin/src/pages/splashScreen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => Stack(
        children: [
          MaterialApp(
            home: SplashScreen(),
            title: 'Educosin',
            theme: ThemeData(
              scaffoldBackgroundColor: Color(0x00000000),
              primaryColor: Color.fromRGBO(0, 90, 179, 1),
              primaryColorLight: Color.fromRGBO(0, 143, 214, 1),
              accentColor: Color.fromRGBO(255, 204, 0, 1),
              highlightColor: Color.fromRGBO(230, 230, 230, 1),

              // Define la Familia de fuente por defecto
              fontFamily: 'Lato',
            ), // initialRoute: '/',
            debugShowCheckedModeBanner: false,
          )
        ],
      ),
    );
  }
}
