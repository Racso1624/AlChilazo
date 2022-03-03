import 'package:flutter/material.dart';

import './trabajadores.dart';
import './pantalla_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  //variable global.

  @override
  Widget build(BuildContext context) {
    //lista de trabajadores, en este caso se debe de utilizar la vista de ofrecer servicios
    //y al agregar datos se deben de agregar datos a una lista, la cual luego esta utilizara esa lista en vez de esta.

    return MaterialApp(
      title: 'Al Chilazo',
      home: HomePage(),
    );
  }
}
