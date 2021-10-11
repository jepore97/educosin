import 'package:educosin/src/pages/selectGrade.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:educosin/src/utils/widgets.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Widgets.bottomshet(context),
      body: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 143, 214, 1),
                Color.fromRGBO(0, 90, 179, 1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Widgets.audioAndDate(context),
              content(),
              /* selects(),
              botonAEstudiar() */

              info()
            ],
          )),
    );
  }

  Widget info() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.info,
          color: Theme.of(context).highlightColor,
          size: 50,
        )
      ],
    );
  }

  Widget content() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          subtitle(),
          buttons(),
          Widgets.singIn(context),
        ],
      ),
    );
  }

  Widget subtitle() {
    return Container(
        margin: EdgeInsets.only(top: 60),
        child: Text(
          '¿Cómo deseas estudiar hoy?',
          style: TextStyle(
            color: Theme.of(context).highlightColor,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  Widget buttons() {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SelectGrade()));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(
                      50) // use instead of BorderRadius.all(Radius.circular(20))
                  ),
              padding: EdgeInsets.all(30),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Image(
                      height: 120,
                      image: AssetImage('assets/images/GRADUANDO.png'),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'ESTUDIO',
                        style: TextStyle(
                            fontSize: 50,
                            color: Theme.of(context).primaryColorLight,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'PERSONALIZADO',
                        style: TextStyle(
                            fontSize: 30,
                            color: Theme.of(context).primaryColorLight,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => SelectGrade()));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).highlightColor,
                  borderRadius: BorderRadius.circular(
                      50) // use instead of BorderRadius.all(Radius.circular(20))
                  ),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 40),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Image(
                      height: 120,
                      image: AssetImage('assets/images/TORRE.png'),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'JUEGO',
                        style: TextStyle(
                            fontSize: 50,
                            color: Theme.of(context).primaryColorLight,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'AGILMATE',
                        style: TextStyle(
                            fontSize: 45,
                            color: Theme.of(context).primaryColorLight,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
