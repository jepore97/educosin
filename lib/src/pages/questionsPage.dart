import 'package:educosin/src/utils/widgets.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  QuestionsPage({Key key}) : super(key: key);

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  String opt = '1';
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
              questions(opt),
            ],
          )),
    );
  }
}

questions(opt) {
  switch (opt) {
    case '1':
      return question1();
      break;
    default:
  }
}

question1() {
  return Container(
    decoration: BoxDecoration(color: Colors.amber),
    child: Expanded(
      child: Column(
        children: [Text('hola'), Text('hola')],
      ),
    ),
  );
}
