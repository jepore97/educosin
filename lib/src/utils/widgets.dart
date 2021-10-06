import 'package:flutter/material.dart';

class Widgets {
  static bottomshet(context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            width: 300,
            height: 100,
            image: AssetImage('assets/images/logocompletoazul.png'),
          ),
          Image(
            width: 300,
            image: AssetImage('assets/images/colciencias.png'),
          ),
          Image(
            width: 300,
            image: AssetImage('assets/images/mineducacion.png'),
          ),
        ],
      ),
    );
  }

  static drawer() {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }

  static audioAndDate(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
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

  static singIn(context) {
    return Container(
      margin: EdgeInsets.only(top: 60),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
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
                  style: TextStyle(
                      color: Theme.of(context).highlightColor, fontSize: 20),
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
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 20),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
