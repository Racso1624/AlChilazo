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
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Al Chilazo"),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                './images/alchilazo.png',
                height: 300.0,
              ),
              SizedBox(
                height: 15.0,
              ),
              _bottonLogin(),
              SizedBox(
                height: 15.0,
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
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Log In'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
            padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
            child: Text('Sign Up'),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Registro()));
          });
    });
  }
}
