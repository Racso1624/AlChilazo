import 'package:alchilazo/mongo.dart';
import 'package:alchilazo/register_worker.dart';
import 'package:alchilazo/services_screen.dart';
import 'package:alchilazo/worker_services.dart';
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
  List<String> usuario_existentes = [];

  Future _getData() async {
    arrData = await MongoDatabase.getData_workers();
    for (var x = 0; x < arrData.length; x++) {
      personal_servicio.add(arrData[x]['name'].toString());
      usuario_existentes.add(arrData[x]['email'].toString());
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
        backgroundColor: Color.fromRGBO(245, 71, 72, 1)
      ),
      body: Column(
        children: [
          Text("Hola, ${widget.name}"),
          //boton para ir a llenar para ofrecer servicios
          ElevatedButton(
            child: Text('Ofrecer Servicio'),
            onPressed: () {
              print(usuario_existentes);
              for (var i = 0; i < usuario_existentes.length; i++) {
                print(usuario_existentes[i]);
                if (widget.correo == usuario_existentes[i]) {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Servicios_Trabajador()));
                  break;
                }
                else{
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterWorker(name: widget.name, correo: widget.correo)));
                  break;
                }
              }
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
