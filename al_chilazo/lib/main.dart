// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  void respuesta() {
    print('hola mundo');
  }

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Al Chilazo"),
          backgroundColor: Color.fromARGB(225, 255, 4, 4),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: Text('Ofrecer Servicio'),
              onPressed: respuesta,
            ),
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
