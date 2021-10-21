import 'package:educosin/src/pages/principalPage.dart';
import 'package:educosin/src/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class QuestionsPage extends StatefulWidget {
  QuestionsPage({Key key}) : super(key: key);

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  int opt = 1;
  bool correct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Widgets.bottomshet(context),
      body: Container(
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Widgets.audioAndDate(context),
              Container(
                margin: EdgeInsets.only(
                  top: 90,
                  right: 80,
                  left: 80,
                ),
                child: Column(children: [
                  Container(
                    child: questions(opt),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PrincipalPage()));
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20),
                            width: 130,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(
                                    10) // use instead of BorderRadius.all(Radius.circular(20))
                                ),
                            child: Center(
                              child: Text(
                                'SALIR',
                                style: TextStyle(fontSize: 35),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          )),
    );
  }

  questions(opt) {
    switch (opt) {
      case 1:
        return question1();
        break;
      case 2:
        return question2();
        break;
      default:
    }
  }

  question1() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'Determina cuáles de los siguientes enunciados son proposiciones:',
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 30,
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('1 - ',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text('¿Dónde estoy?', style: TextStyle(fontSize: 30))
                      ],
                    ),
                    Row(
                      children: [
                        Text('2 - ',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text('Todas las aves vuelan',
                            style: TextStyle(fontSize: 30))
                      ],
                    ),
                    Row(
                      children: [
                        Text('3 - ',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text('¡Viva la vida!', style: TextStyle(fontSize: 30))
                      ],
                    ),
                    Row(
                      children: [
                        Text('4 - ',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text('Todos amamos las matemáticas',
                            style: TextStyle(fontSize: 30))
                      ],
                    ),
                    Row(
                      children: [
                        Text('5 - ',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text('Mi mamá me ama', style: TextStyle(fontSize: 30))
                      ],
                    ),
                    Row(
                      children: [
                        Text('6 - ',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                        Text('4 + 5 = 15', style: TextStyle(fontSize: 30))
                      ],
                    )
                  ],
                ),
              ),
              Column(children: [
                options('A', false, '1 - 2 - 3 - 6'),
                options('B', false, '3 - 4 - 5 - 6'),
                options('C', true, '2 - 4 - 5 - 6'),
                options('D', false, '1 - 3 - 5 - 6'),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  question2() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('El número que satisface a la ecuación',
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 30,
                )),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'S + 18 = 36',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              Column(children: [
                options('A', false, '16'),
                options('B', false, '63'),
                options('C', false, '54'),
                options('D', true, '18'),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  options(option, value, text) {
    return Row(children: [
      InkWell(
        onTap: () async {
          Widgets.showLoaderDialog(context, value);
          await Future.delayed(Duration(milliseconds: 1500));
          Navigator.pop(context);
          if (value) {
            setState(() {
              opt = opt + 1;
            });
          }
          if (opt == 3)
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => PrincipalPage()));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          width: 60,
          height: 60,
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(
                  10) // use instead of BorderRadius.all(Radius.circular(20))
              ),
          child: Center(
            child: Text(
              option,
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).primaryColorLight,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      Text(
        text,
        style: TextStyle(
            fontSize: 30,
            color: Theme.of(context).primaryColorLight,
            fontWeight: FontWeight.bold),
      )
    ]);
  }
}
