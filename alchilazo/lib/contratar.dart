// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables
import 'package:alchilazo/mongo.dart';
import 'package:flutter/material.dart';

class Contratar extends StatefulWidget {
  const Contratar({Key? key, required this.info_trabajador}) : super(key: key);
  final info_trabajador;

  @override
  State<Contratar> createState() => _Contratar();
}

class _Contratar extends State<Contratar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Main widget
      appBar: AppBar(
        title: Text('Contratar Trabajador'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(245, 71, 72, 1),
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
            child: Text("Nombre: ${widget.info_trabajador["name"]}",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Telefono: ${widget.info_trabajador["phone"]}",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text("Direccion: ${widget.info_trabajador["address"]}",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
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
          Image.network(
                "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png"),
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
            child: Text("${widget.info_trabajador["descripcion"]}"),
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
