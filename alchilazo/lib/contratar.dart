// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Contratar extends StatefulWidget {
  const Contratar({Key? key}) : super(key: key);

  @override
  State<Contratar> createState() => _Contratar();
}

class _Contratar extends State<Contratar> {
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      //Main widget
      appBar: AppBar(
        title: Text('Contratar Trabajador'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      // ignore: prefer_const_constructors
      body: ListView(
        padding:
            EdgeInsets.only(top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
        children: <Widget>[
          Text(
            'Datos',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Tu dirección: \n3ra Calle 4-17, Zona 10,Ciudad de Guatemala\n\n',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Image(
            image: AssetImage('images/mapsImage.png'),
            height: 300.0,
            width: 500.0,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '\nFoto de perfil:\n',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Image(
            image: AssetImage('images/worker.jpg'),
            height: 200.0,
            width: 300.0,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '\nDescripción:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(0, 0, 0, 0)),
              shape: BoxShape.rectangle,
            ),
            child: Text(
                '\nSoy un electricista profesional, me encanta mi trabajo. Tengo multiples años de experiencia en arreglar sistemas electricos e instalarlos.\n'),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '\nFotos del trabajos realizados:\n',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage('images/pic1.jpg'),
                height: 100.0,
                width: 200.0,
              ),
              Image(
                image: AssetImage('images/pic2.jpg'),
                height: 100.0,
                width: 200.0,
              ),
            ], //Children
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage('images/instalador-electricista-715x495.jpg'),
                height: 100.0,
                width: 200.0,
              ),
              Text("\n"),
              Image(
                image: AssetImage('images/pic4.png'),
                height: 100.0,
                width: 200.0,
              ),
            ], //Children
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: Text(
                'Contratar',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
