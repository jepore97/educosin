import 'package:flutter/material.dart';

class SelectGrade extends StatefulWidget {
  SelectGrade({Key key}) : super(key: key);

  @override
  _SelectGradeState createState() => _SelectGradeState();
}

class _SelectGradeState extends State<SelectGrade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            children: [audioAndDate(), singIn(), subtitle()],
          )),
    );
  }

  Widget audioAndDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              child: Row(
                children: [
                  Icon(
                    Icons.volume_up_rounded,
                    color: Theme.of(context).accentColor,
                    size: 40,
                  ),
                  Text(
                    'Audio activado',
                    style: TextStyle(color: Theme.of(context).highlightColor),
                  )
                ],
              ),
            )
          ],
        ),
        Row(
          children: [
            Text(
              'Última fecha de ingreso: ',
              style: TextStyle(color: Theme.of(context).highlightColor),
            ),
            Text(
              '03|09|2021',
              style: TextStyle(color: Theme.of(context).highlightColor),
            )
          ],
        )
      ],
    );
  }

  Widget singIn() {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).highlightColor,
                    ),
                    borderRadius: BorderRadius.circular(
                        20) // use instead of BorderRadius.all(Radius.circular(20))
                    ),
                padding: EdgeInsets.all(5),
                child: Text(
                  'Iniciar sesión para una experiencia personalizada',
                  style: TextStyle(color: Theme.of(context).highlightColor),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    border: Border.all(
                      color: Theme.of(context).highlightColor,
                    ),
                    borderRadius: BorderRadius.circular(
                        20) // use instead of BorderRadius.all(Radius.circular(20))
                    ),
                padding: EdgeInsets.all(5),
                child: Text(
                  'Quiero Registrarme',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget subtitle() {
    return Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Selecciona el ',
                  style: TextStyle(
                      color: Theme.of(context).highlightColor, fontSize: 50),
                ),
                Text(
                  'Grado, Periodo y Materia ',
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 50),
                ),
              ],
            ),
            Text(
              'que desea estudiar',
              style: TextStyle(
                  color: Theme.of(context).highlightColor, fontSize: 50),
            )
          ],
        ));
  }
}
