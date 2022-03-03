import 'package:flutter/material.dart';

import './trabajadores.dart';

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
  var personal_servicio = [
    'Luis Gutierrez',
    'Pedro Pablo',
    'Oscar Fernando',
    'Jorge Caballeros',
    'Yong Park',
    'Santiago Taracena',
  ];
  var i = 0;

  void siguiente() {
    if (i > (personal_servicio.length - 4)) {
      setState(() {
        i = 0;
      });
    } else {
      setState(() {
        i = i + 1;
      });
    }
    print(i);
  }

  void anterior() {
    if (i < 1) {
      setState(() {
        i = 3;
      });
    } else {
      setState(() {
        i = i - 1;
      });
    }
    print(i);
  }

  @override
  Widget build(BuildContext context) {
    //lista de trabajadores, en este caso se debe de utilizar la vista de ofrecer servicios
    //y al agregar datos se deben de agregar datos a una lista, la cual luego esta utilizara esa lista en vez de esta.

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
              onPressed: null,
            ),
            //muestra todos las personas disponibles que ofrecen servicios
            Trabajadores(
              personal_servicio[i],
            ),
            Trabajadores(
              personal_servicio[i + 1],
            ),
            Trabajadores(
              personal_servicio[i + 2],
            ),
            //boton para ver siguientes trabajadores
            ElevatedButton(
              child: Text('Siguiente'),
              onPressed: siguiente,
            ),
            //boton para ver anteriores trabajadores
            ElevatedButton(
              child: Text('Anterior'),
              onPressed: anterior,
            ),
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
