// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {}

class MyAppState extends State {
  //variable global
  var i = 0;

  void respuesta() {
    i = i + 1;
    print(i);
  }

  @override
  Widget build(BuildContext context) {
    //lista de trabajadores, en este caso se debe de utilizar la vista de ofrecer servicios
    //y al agregar datos se deben de agregar datos a una lista, la cual luego esta utilizara esa lista en vez de esta.
    var trabajadores = ['Luis Gutierrez', 'Pedro Pablo'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Al Chilazo"),
          backgroundColor: Color.fromARGB(225, 255, 4, 4),
        ),
        body: Column(
          children: [
            //boton para ir a llenar para ofrecer servicios
            ElevatedButton(
              child: Text('Ofrecer Servicio'),
              onPressed: respuesta,
            ),
            //muestra todos las personas disponibles que ofrecen servicios
            Text(trabajadores[i]),
            //boton para buscar servicios
            ElevatedButton(
              child: Text('Servicios'),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
