import 'package:alchilazo/pantalla_prueba.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  //lista con nombres
  List<String> personal_servicio = <String>[
    'Luis Gutierrez',
    'Pedro Pablo',
    'Oscar Fernando',
    'Jorge Caballeros',
    'Yong Park',
    'Santiago Taracena',
    'Jorge Antonio',
    'Maria Luisa',
    'Estefani Gutierrez',
    'Carlos Agustin',
    'Esteban Kirstin',
    'Rodrigo Barrera',
    'Marco Antonio',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Al Chilazo"),
        backgroundColor: Color.fromARGB(225, 255, 4, 4),
      ),
      body: Column(
        children: [
          //boton para ir a llenar para ofrecer servicios
          ElevatedButton(
            child: Text('Ofrecer Servicio'),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => pantalla_prueba()));
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
                  MaterialPageRoute(builder: (context) => pantalla_prueba()));
            },
          ),
        ],
      ),
    );
  }
}