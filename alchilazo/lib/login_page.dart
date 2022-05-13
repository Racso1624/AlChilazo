import 'package:alchilazo/registro_usuario.dart';
import 'package:flutter/material.dart';
import 'ingreso_sesion.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Image.asset(
                './images/logo_transparent.png',
                height: 400.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              _bottonLogin(),
              SizedBox(
                height: 20.0,
              ),
              _buttonRegister()
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottonLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 92.0, vertical: 20.0),
            child: Text('Iniciar Sesión'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: const Color.fromRGBO(248, 216, 74, 1),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Ingreso()));
          });
    });
  }

  Widget _buttonRegister() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
            child: Text('Registrarse'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: const Color.fromRGBO(248, 216, 74, 1),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Registro()));
          });
    });
  }
}
