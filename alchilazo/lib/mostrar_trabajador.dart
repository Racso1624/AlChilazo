import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:flutter/material.dart';
import 'MongoDbModel_Worker.dart';
import 'mongo.dart';

class ViewWorker extends StatefulWidget {
  const ViewWorker({Key? key, required this.trabajo,required this.trabajadores}) : super(key: key);
  final String trabajo;
  final Future<List<dynamic>> trabajadores;

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
          Text('xd'),
          Container(
            height: 90,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: 0,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(child: Text('a')),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
          //boton para buscar servicios
          ElevatedButton(
            child: Text('Servicios'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
