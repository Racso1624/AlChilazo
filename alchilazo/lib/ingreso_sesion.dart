import 'package:alchilazo/pantalla_home.dart';
import 'package:flutter/material.dart';

class Ingreso extends StatefulWidget {
  static String id = 'ingreso_sesion';

  @override
  State<Ingreso> createState() => _IngresoState();
}

class _IngresoState extends State<Ingreso> {
  //uso para obtener los datos ingreados para subirlo luego a la base de datos
  final name = TextEditingController();
  final pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Ingreso"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15.0,
            ),
            _userTextField(),
            SizedBox(
              height: 15.0,
            ),
            _userPassword(),
            SizedBox(
              height: 20.0,
            ),
            _buttonLogin(),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    ));
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: name,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.email),
            hintText: 'ejemplo@correo.com',
            labelText: 'Correo electronico',
          ),
          //Variable que recibirá el correo
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _userPassword() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: pass,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: '123456',
            labelText: 'Contraseña',
          ),
          //Variable que recibirá el correo
          onChanged: (value) {},
        ),
      );
    });
  }

  Widget _buttonLogin() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
            print(name.text);
            print(pass.text);
          },
        );
      },
    );
  }
}
