import 'package:educosin/src/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final List<String> _dropdownValuesPeriodo = [
    "PERIODO 1",
    "PERIODO 2",
    "PERIODO 3",
    "PERIODO 4",
  ];
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      extendBodyBehindAppBar: true,
      drawerEnableOpenDragGesture: false,
      bottomSheet: Widgets.bottomshet(context),
      drawer: Widgets.drawer(),
      body: Container(
        // padding: EdgeInsets.all(10),
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
            Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Theme.of(context).highlightColor,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.menu,
                                      size: 60,
                                      color: Theme.of(context).accentColor,
                                    ),
                                    onPressed: () {
                                      scaffoldKey.currentState.openDrawer();
                                    }),
                                buttonsFile(),
                              ],
                            ),
                            selects()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Widgets.audioAndDate(context),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image(
                              width: 100,
                              image: AssetImage('assets/images/LIBROS.png'),
                            ),
                            Text(
                              'BIBLIOTECA',
                              style: TextStyle(
                                  color: Theme.of(context).highlightColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              margin: EdgeInsets.symmetric(vertical: 10.0),
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
                                    fontSize: 20,
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              margin: EdgeInsets.symmetric(vertical: 10.0),
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
                                    fontSize: 20,
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
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            textDesc()
          ],
        ),
      ),
    );
  }

  Widget textDesc() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 60.0, horizontal: 10),
      child: Row(
        children: [
          Icon(
            Icons.help,
            color: Theme.of(context).highlightColor,
            size: 100,
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Nota:',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 25),
                  ),
                  Text(
                    'Recuerda que no necesitas conexión a internet para ver los OVA, OVA+ ni las',
                    style: TextStyle(
                        color: Theme.of(context).highlightColor, fontSize: 25),
                  ),
                ],
              ),
              Text(
                'Evaluaciones, solo para la sesión de RED si se requiere Conexión a internet.',
                style: TextStyle(
                    color: Theme.of(context).highlightColor, fontSize: 25),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buttonsFile() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 60),
      child: Row(
        children: [
          buttonFile('OVA+'),
          buttonFile('RED'),
          buttonFile('PDF'),
          buttonFile('OFFICE'),
        ],
      ),
    );
  }

  buttonFile(String text) {
    return TextButton(
      onPressed: () {},
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(
                10) // use instead of BorderRadius.all(Radius.circular(20))
            ),
        child: Text(text,
            style: TextStyle(
                fontSize: 40,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget selects() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 60),
      margin: EdgeInsets.symmetric(vertical: 60.0, horizontal: 60),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 10.0),
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
                      fontSize: 40,
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
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: EdgeInsets.symmetric(vertical: 10.0),
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
                      fontSize: 40,
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
            ],
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                width: 200,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(
                        10) // use instead of BorderRadius.all(Radius.circular(20))
                    ),
                child: Row(
                  // Replace with a Row for horizontal icon + text
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.play_arrow,
                        color: Theme.of(context).primaryColor, size: 45),
                    Text(" Ver  ",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                width: 200,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(
                        10) // use instead of BorderRadius.all(Radius.circular(20))
                    ),
                child: Row(
                  // Replace with a Row for horizontal icon + text
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("  HACER  ",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 40,
                            fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
