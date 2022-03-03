import 'package:al_chilazo/pantalla_prueba.dart';
import 'package:flutter/material.dart';
import './trabajadores.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  //variable global.
  var personal_servicio = [
    'Luis Gutierrez',
    'Pedro Pablo',
    'Oscar Fernando',
    'Jorge Caballeros',
    'Yong Park',
    'Santiago Taracena',
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
        i = 3;
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
          //muestra todos las personas disponibles que ofrecen servicios
          Trabajadores(
            personal_servicio[i],
          ),
          Trabajadores(
            personal_servicio[i + 1],
          ),
          Trabajadores(
            personal_servicio[i + 2],
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
          //boton para buscar servicios
          ElevatedButton(
            child: Text('Servicios'),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}
