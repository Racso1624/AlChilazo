import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:flutter/material.dart';
import 'MongoDbModel_Worker.dart';
import 'mongo.dart';

class ViewWorker extends StatefulWidget {
  const ViewWorker({Key? key, required this.trabajo,required this.trabajadores}) : super(key: key);
  final String trabajo;
  final List trabajadores;

  @override
  State<ViewWorker> createState() => _ServicesWorkers();
}

class _ServicesWorkers extends State<ViewWorker> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Al Chilazo"),
        backgroundColor: Color.fromARGB(225, 255, 4, 4),
      ),
      body: Column(
        children: [
          Divider(
            color: Colors.black,
          ),
          //muestra todos las personas disponibles que ofrecen servicios
          Text(
            'Trabajadores existentes',
            style: TextStyle(
              fontSize: 25,
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
