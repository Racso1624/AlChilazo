// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables
import 'package:alchilazo/mongo.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class Solicitud extends StatefulWidget {
  const Solicitud({Key? key, required this.info_trabajador}) : super(key: key);
  final info_trabajador;

  @override
  State<Solicitud> createState() => _Solicitud();
}

class _Solicitud extends State<Solicitud> {

  var titulo = TextEditingController();
  var descripcion = TextEditingController();

  /* 
    Con el siguiente Widget se construye el cuerpo de la aplicación.
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Main widget
      appBar: AppBar(
        title: Text('Realizar Solicitud'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(245, 71, 72, 1),
      ),
      // ignore: prefer_const_constructors
      body: ListView(
        padding:
            EdgeInsets.only(top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
        children: <Widget>[
          Text(
            'Explicación Problema',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Título del Problema:",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          _titleTextField(),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '\nDescripción del Problema:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          _descriptionTextField(),
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

  /*
    El siguiente Widget será utilizado para darle titulo
    al problema que el usuario quiere resolver al momento de 
    contratar un servicio.
  */

  Widget _titleTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        key: const Key('titulo'),
        controller: titulo,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Titulo del Problema',
        ),
        //Variable que recibirá el correo
        onChanged: (value) {},
      ),
    );
  }

  /*
    El siguiente Widget será utilizado para darle la descripción
    del problema que el usuario quiere resolver al momento de 
    contratar un servicio. 
  */

  Widget _descriptionTextField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        key: const Key('descripcion'),
        controller: descripcion,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: 'Descripcion del Problema',
        ),
        //Variable que recibirá el correo
        onChanged: (value) {},
      ),
    );
  }

}

