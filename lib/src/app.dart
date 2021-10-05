import 'package:educosin/src/pages/selectGrade.dart';
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
            home: SelectGrade(),
            title: 'Colombia Enduro',

            theme: ThemeData(
              brightness: Brightness.light,
              scaffoldBackgroundColor: Color.fromRGBO(0, 143, 214, 1),
              primaryColor: Color.fromRGBO(0, 90, 179, 1),
              primaryColorLight: Colors.blueGrey[500],
              dialogBackgroundColor: Colors.blueGrey[200],
              secondaryHeaderColor: Colors.orange[100],
              accentColor: Colors.orange[400],
              backgroundColor: Colors.white,
              highlightColor: Color.fromRGBO(230, 230, 230, 1),

              // Define la Familia de fuente por defecto
              fontFamily: 'Montserrat',

              // Define el TextTheme por defecto. Usa esto para espicificar el estilo de texto por defecto
              // para cabeceras, títulos, cuerpos de texto, y más.
            ),
            darkTheme: ThemeData(
              //Se indica que el tema tiene un brillo oscuro
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.grey[900],
              primaryColor: Colors.grey[900],
              primaryColorLight: Colors.grey[700],
              dialogBackgroundColor: Colors.grey[600],
              cardColor: Colors.black12,
              splashColor: Colors.blueGrey[200],
              textTheme: TextTheme(
                  title: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              textSelectionColor: Colors.white,
              secondaryHeaderColor: Colors.orange[100],
              accentColor: Colors.orange[400],
            ),
            // initialRoute: '/',
            debugShowCheckedModeBanner: false,
          )
        ],
      ),
    );
  }
}
