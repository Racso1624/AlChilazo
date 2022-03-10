import 'package:al_chilazo/pantalla_prueba.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  //lista con nombres
  final List<String> personal_servicio = <String>[
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
  ];

  var i = 0;
  //metodo para que muestre el siguiete de la lista de los trabajadores
  void siguiente() {
    if (i > (personal_servicio.length - 4)) {
      setState(() {
        i = 0;
      });
    } else {
      setState(() {
        i = i + 1;
      });
    }
    print(i);
  }

  //metodo para que muestre el anterior de la lista de los trabajadores
  void anterior() {
    if (i < 1) {
      setState(() {
        i = personal_servicio.length - 3;
      });
    } else {
      setState(() {
        i = i - 1;
      });
    }
    print(i);
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
          Text(
            'Trabajadores existentes',
            textScaleFactor: 1.5,
          ),
          ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: personal_servicio.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                child: Center(child: Text('Entry ${personal_servicio[index]}')),
              );
            },
          ),
          //muestra todos las personas disponibles que ofrecen servicios
          /*Trabajadores(
            personal_servicio[i],
          ),
          Trabajadores(
            personal_servicio[i + 1],
          ),
          Trabajadores(
            personal_servicio[i + 2],
          ),*/
          Divider(
            color: Colors.black,
          ),
          //boton para ver siguientes trabajadores
          ElevatedButton(
            child: Text('Siguiente'),
            onPressed: siguiente,
          ),
          //boton para ver anteriores trabajadores
          ElevatedButton(
            child: Text('Anterior'),
            onPressed: anterior,
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
