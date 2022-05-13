import 'package:alchilazo/services_screen.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:flutter/material.dart';
import 'MongoDbModel_Worker.dart';
import 'mongo.dart';

class ViewWorker extends StatefulWidget {
  const ViewWorker({Key? key, required this.trabajo}) : super(key: key);
  final String trabajo;

  @override
  State<ViewWorker> createState() => _ServicesWorkers();
}

class _ServicesWorkers extends State<ViewWorker> {
  var arrData = [];

  Future _getData() async {
    arrData = await MongoDatabase.getData_workers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getData();
    });
  }

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
          Text(arrData.toString())
        ],
      ),
    );
  }
}
