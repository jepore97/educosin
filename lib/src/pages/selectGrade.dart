import 'package:educosin/src/pages/principalPage.dart';
import 'package:educosin/src/utils/widgets.dart';
import 'package:flutter/material.dart';

import 'loading.dart';

class SelectGrade extends StatefulWidget {
  SelectGrade({Key key}) : super(key: key);

  @override
  _SelectGradeState createState() => _SelectGradeState();
}

class _SelectGradeState extends State<SelectGrade> {
  final List<String> _dropdownValues = [
    "GRADO 1",
    "GRADO 2",
    "GRADO 3",
    "GRADO 4",
    "GRADO 5",
    "GRADO 6",
    "GRADO 7",
    "GRADO 8",
    "GRADO 9",
    "GRADO 10",
    "GRADO 11",
  ];
  final List<String> _dropdownValuesPeriodo = [
    "PERIODO 1",
    "PERIODO 2",
    "PERIODO 3",
    "PERIODO 4",
  ];
  final List<String> _dropdownValuesMateria = [
    "MATEMATICAS",
    "ESPAÑOL",
    "DEPORTE",
    "FILOSOFIA",
    "IDIOMAS",
    "ADMINISTRACIÓN",
    "GEOMETRIA",
    "CALIGRAFIA",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Widgets.bottomshet(context),
      body: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height - 95,
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
              Widgets.singIn(context),
              subtitle(),
              selects(),
              botonAEstudiar()
            ],
          )),
    );
  }

  Widget subtitle() {
    return Container(
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selecciona el ',
                  style: TextStyle(
                      color: Theme.of(context).highlightColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'GRADO, Periodo y Materia ',
                  style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Text(
              'que desea estudiar',
              style: TextStyle(
                  color: Theme.of(context).highlightColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  Widget selects() {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: Theme.of(context).highlightColor,
                  style: BorderStyle.solid,
                  width: 0.80),
            ),
            child: DropdownButton(
              style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
              items: _dropdownValues
                  .map((value) => DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      ))
                  .toList(),
              onChanged: (String value) {
                value = value;
              },
              isExpanded: false,
              value: _dropdownValues.first,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: Theme.of(context).highlightColor,
                  style: BorderStyle.solid,
                  width: 0.80),
            ),
            child: DropdownButton(
              style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
              items: _dropdownValuesPeriodo
                  .map((value) => DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      ))
                  .toList(),
              onChanged: (String value) {},
              isExpanded: false,
              value: _dropdownValuesPeriodo.first,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
              color: Theme.of(context).highlightColor,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  color: Theme.of(context).highlightColor,
                  style: BorderStyle.solid,
                  width: 0.80),
            ),
            child: DropdownButton(
              style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
              items: _dropdownValuesMateria
                  .map((value) => DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      ))
                  .toList(),
              onChanged: (String value) {},
              isExpanded: false,
              value: _dropdownValuesMateria.first,
            ),
          )
        ],
      ),
    );
  }

  Widget botonAEstudiar() {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => PageLoading()));
      },
      child: Container(
        margin: EdgeInsets.only(top: 40),
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(
                10) // use instead of BorderRadius.all(Radius.circular(20))
            ),
        padding: EdgeInsets.all(10),
        child: Text(
          '¡A ESTUDIAR!',
          style: TextStyle(
              fontSize: 25,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
