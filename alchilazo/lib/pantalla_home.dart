import 'package:alchilazo/mongo.dart';
import 'package:alchilazo/register_worker.dart';
import 'package:alchilazo/services_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.name, required this.correo})
      : super(key: key);
  @override
  final String name;
  final String correo;
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  var arrData = [];
  //lista con nombres
  List<String> personal_servicio = [];

  Future _getData() async {
    arrData = await MongoDatabase.getData_workers();
    for (var x = 0; x < arrData.length; x++) {
      personal_servicio.add(arrData[x]['name'].toString());
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Al Chilazo"),
        backgroundColor: Color.fromARGB(225, 255, 4, 4),
      ),
      body: Column(
        children: [
          //Text(personal_servicio.toString()),
          Text("Bienvenido: ${widget.name}"),
          //boton para ir a llenar para ofrecer servicios
          ElevatedButton(
            child: Text('Ofrecer Servicio'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterWorker(
                          name: widget.name, correo: widget.correo)));
            },
          ),
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
          Container(
            height: 90,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: personal_servicio.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(child: Text(personal_servicio[index])),
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ServicesScreen()));
            },
          ),
        ],
      ),
    );
  }
}
