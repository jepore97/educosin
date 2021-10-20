import 'dart:async';
import 'dart:math';

import 'package:educosin/src/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

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

  final List<String> _PDF = [
    "Funciones Actividades",
    "Ejemplos",
  ];

  String option = "Home";
  bool cont = true;
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = true;
  PDFDocument document;
  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
    loadDocument();
  }

  loadDocument() async {
    document = await PDFDocument.fromAsset(
        'assets/images/Secundaria Activa Matemáticas 9°.pdf');

    setState(() => _isLoading = false);
  }

  Future<void> initializeVideoPlayer() async {
    videoPlayerController = VideoPlayerController.network(
        "https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4");
    await Future.wait([videoPlayerController.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
    );
  }

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
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            color: (option != "Home" && option != "RED")
                                ? Theme.of(context).highlightColor
                                : null,
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
                                        color: (option != "Home" &&
                                                option != "RED")
                                            ? Theme.of(context)
                                                .primaryColorLight
                                            : Theme.of(context).accentColor,
                                      ),
                                      onPressed: () {
                                        scaffoldKey.currentState.openDrawer();
                                      }),
                                  buttonsFile(),
                                ],
                              ),
                              contenido(option),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Widgets.audioAndDate(context),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        option = "Biblioteca";
                                      });
                                    },
                                    child: Container(
                                      child: Image(
                                        width: 100,
                                        height: 200,
                                        image: AssetImage(
                                            'assets/images/LIBROS.png'),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'BIBLIOTECA',
                                    style: TextStyle(
                                        color: Theme.of(context).highlightColor,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  left: BorderSide(
                                    color: Theme.of(context).highlightColor,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Column(
                                children: [
                                  selectP(),
                                  selectP(),
                                  selectP(),
                                  botonAEstudiar()
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              textDesc()
            ],
          ),
        ),
      ),
    );
  }

  Widget textDesc() {
    return Container(
      margin: EdgeInsets.only(bottom: 100),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          option == 'Home'
              ? Row(
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
                                  color: Theme.of(context).accentColor,
                                  fontSize: 25),
                            ),
                            Text(
                              'Recuerda que no necesitas conexión a internet para ver los OVA, OVA+ ni las',
                              style: TextStyle(
                                  color: Theme.of(context).highlightColor,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                        Text(
                          'Evaluaciones, solo para la sesión de RED si se requiere Conexión a internet.',
                          style: TextStyle(
                              color: Theme.of(context).highlightColor,
                              fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                )
              : Container(),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Image(
                    width: 50,
                    image: AssetImage('assets/images/HOME.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Image(
                    width: 50,
                    image: AssetImage('assets/images/BACK.png'),
                  ),
                )
              ],
            ),
          )
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
      onPressed: () {
        setState(() {
          option = text;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: (option != "Home" && option != "RED")
                ? Colors.white
                : Theme.of(context).highlightColor,
            borderRadius: BorderRadius.circular(
                10) // use instead of BorderRadius.all(Radius.circular(20))
            ),
        child: Text(text,
            style: TextStyle(
                fontSize: 40,
                color: Theme.of(context).primaryColorLight,
                fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget selects() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 60),
      margin: EdgeInsets.symmetric(vertical: 60.0, horizontal: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
                width: 250,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(
                        10) // use instead of BorderRadius.all(Radius.circular(20))
                    ),
                child: InkWell(
                  onTap: () {
                    _showMaterialDialog();
                  },
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
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                width: 250,
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

  Widget selectP() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.symmetric(vertical: 5.0),
      width: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Theme.of(context).highlightColor,
            style: BorderStyle.solid,
            width: 0.80),
      ),
      child: Center(
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
    );
  }

  Widget botonAEstudiar() {
    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => PrincipalPage()));
      },
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(
                10) // use instead of BorderRadius.all(Radius.circular(20))
            ),
        padding: EdgeInsets.all(10),
        child: Center(
          child: Text(
            'Actualizar',
            style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget contenido(String optionSection) {
    switch (optionSection) {
      case "Home":
        return selects();
        break;
      case "Biblioteca":
        return biblioteca(_buildItems(6));
        break;
      case "OVA+":
        return biblioteca(_buildItemsOva(3));
        break;
      case "PDF":
        return biblioteca(_buildItemsPDF());
        break;
      default:
        return CircularProgressIndicator();
    }
  }

  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Video'),
            content: Container(
              child: Center(
                child: chewieController != null &&
                        chewieController
                            .videoPlayerController.value.isInitialized
                    ? Chewie(
                        controller: chewieController,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text("Loading"),
                        ],
                      ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    _dismissDialog();
                  },
                  child: Text('Cerrar')),
            ],
          );
        });
  }

  void _showMaterialDialogPdf() {
    // Load from assets

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Center(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : PDFViewer(
                      document: document,
                      zoomSteps: 1,
                      enableSwipeNavigation: true,
                      indicatorBackground: Theme.of(context).accentColor),
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  _dismissDialog();
                },
                child: Text('Cerrar')),
          ],
        );
      },
    );
  }

  _dismissDialog() {
    Navigator.pop(context);
  }

  Widget biblioteca(List item) {
    return Container(
      color: Theme.of(context).highlightColor,
      padding: EdgeInsets.all(10),
      height: 600,
      width: 700,
      child: GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
        childrenDelegate: SliverChildListDelegate(item),
      ),
    );
  }

  Widget pdf() {
    return Container(
      color: Theme.of(context).highlightColor,
      padding: EdgeInsets.all(10),
      height: 800,
      width: 700,
      child: GridView.custom(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
        childrenDelegate: SliverChildListDelegate(_buildItemsPDF()),
      ),
    );
  }

  List _buildItems(int count) {
    List<Widget> listItems = List();

    for (int i = 1; i <= count; i++) {
      print('assets/images/' + i.toString() + '.png');
      listItems.add(
        InkWell(
          onTap: () {
            _showMaterialDialogPdf();
          },
          child: Container(
            padding: EdgeInsets.only(top: 15),
            child: Center(
              child: Image(
                width: 250,
                height: 400,
                image: AssetImage('assets/images/' + i.toString() + '.png'),
              ),
            ),
          ),
        ),
      );
    }
    return listItems;
  }

  List _buildItemsOva(int count) {
    List<Widget> listItems = List();

    for (int i = 1; i <= count; i++) {
      print('assets/images/' + i.toString() + '.png');
      listItems.add(
        Container(
          // Con esta propiedad agregamos margen a nuestro Card
          // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
          margin: EdgeInsets.all(15),

          child: Column(
            children: [
              Container(
                width: 200,
                height: 200,
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Matematicas',
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Matematicas',
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '1p1',
                        style: TextStyle(
                            color: Theme.of(context).highlightColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Agilmate 1p1: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'Profesor: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('Lic.Freddy')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Duracion: ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('30 Minutos')
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }
    return listItems;
  }

  List _buildItemsPDF() {
    List<Widget> listItems = List();
    for (int i = 1; i <= _PDF.length; i++) {
      listItems.add(
        InkWell(
          onTap: () {
            _showMaterialDialogPdf();
          },
          child: Container(
            padding: EdgeInsets.only(top: 15),
            child: Center(
              child: Column(
                children: [
                  Image(
                    width: 160,
                    image: AssetImage('assets/images/pdf-2.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      _PDF[i - 1],
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }
    return listItems;
  }
  // Widget ova() {
  //   return Card(
  //     // Con esta propiedad modificamos la forma de nuestro card
  //     // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),

  //     // Con esta propiedad agregamos margen a nuestro Card
  //     // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
  //     margin: EdgeInsets.all(15),

  //     // Con esta propiedad agregamos elevación a nuestro card
  //     // La sombra que tiene el Card aumentará
  //     elevation: 10,
  //     child: Column(
  //       children: [
  //         Container(
  //           width: 200,
  //           height: 200,
  //           color: Colors.red,
  //           child: Center(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text(
  //                   'Matematicas',
  //                   style: TextStyle(
  //                       color: Theme.of(context).highlightColor,
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //                 Text(
  //                   'Matematicas',
  //                   style: TextStyle(
  //                       color: Theme.of(context).highlightColor,
  //                       fontSize: 30,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //                 Text(
  //                   '1p1',
  //                   style: TextStyle(
  //                       color: Theme.of(context).highlightColor,
  //                       fontSize: 30,
  //                       fontWeight: FontWeight.bold),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         Column(
  //           children: [
  //             Text(
  //               'AgilMate1P1',
  //               style: TextStyle(fontWeight: FontWeight.bold),
  //             ),
  //             Row(
  //               children: [
  //                 Text(
  //                   'Profesor: ',
  //                   style: TextStyle(fontWeight: FontWeight.bold),
  //                 ),
  //                 Text('Luis Fredy Sanchez')
  //               ],
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Duracion: ',
  //                   style: TextStyle(fontWeight: FontWeight.bold),
  //                 ),
  //                 Text('30 Minutos')
  //               ],
  //             )
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  // final
  //

}
