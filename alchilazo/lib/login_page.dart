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
    return WillPopScope(
      onWillPop: () async {
        return Navigator.canPop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 80.0,
              ),
              Image.asset(
                './images/logo-chile.png',
                height: 250.0,
              ),
              const SizedBox(
                height: 110.0,
              ),
              _bottonLogin(),
              const SizedBox(
                height: 40.0,
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
          color: const Color.fromRGBO(245, 71, 72, 1),
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
          color: const Color.fromRGBO(245, 71, 72, 1),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Registro()));
          });
    });
  }
}
