import 'package:flutter/material.dart';
import 'package:ingreso_app/login_page.dart';

class Registro extends StatefulWidget {
  static String id = 'registro_usuario';

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("Registro"),
      backgroundColor: Color.fromARGB(255, 0, 0, 0),),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            _nameTextField(),
            SizedBox(
              height: 20.0,
            ),
            _emailTextField(),
            SizedBox(
              height: 20.0,
            ),
            _passwordTextField(),
            SizedBox(
              height: 20.0,
            ),
            _dpiTextField(),
            SizedBox(height: 25.0,),
            _buttonRegistrar(),
          ],
        ),
      ),
    ));
  }

 Widget _nameTextField() {
   return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.abc),
            hintText: 'Ejemplo: Juan/Juana',
            labelText: 'Nombre',
          ),
          //Variable que recibirá el correo
          onChanged: (value) {},
        ),
      );
    });
 }

 Widget _emailTextField() {
   return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
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

 Widget _passwordTextField() {
   return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            hintText: 'Ejemplo: 123456',
            labelText: 'Contraseña',
          ),
          //Variable que recibirá el correo
          onChanged: (value) {},
        ),
      );
    });
 }

 Widget _dpiTextField() {
   return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            icon: Icon(Icons.abc),
            hintText: 'Ejemplo: 123456789',
            labelText: 'DPI',
          ),
          //Variable que recibirá el correo
          onChanged: (value) {},
        ),
      );
    });
 }

 Widget _buttonRegistrar() {
   return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Registrar'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          });
    });
 }
}
