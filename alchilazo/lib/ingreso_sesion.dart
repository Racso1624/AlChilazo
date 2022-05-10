import 'package:alchilazo/mongo.dart';
import 'package:alchilazo/pantalla_home.dart';
import 'package:flutter/material.dart';

class Ingreso extends StatefulWidget {
  static String id = 'ingreso_sesion';

  @override
  State<Ingreso> createState() => _IngresoState();
}

class _IngresoState extends State<Ingreso> {
  //uso para obtener los datos ingreados para subirlo luego a la base de datos
  var name = TextEditingController();
  var pass = TextEditingController();
  var arrData = [];

  Future _getData() async {
    arrData = await MongoDatabase.getData_users();
  }

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
            hintText: 'password',
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
            _getData();
            print(name.text);
            print(pass.text);
            for (var x = 0; x < arrData.length; x++) {
              if (name.text == arrData[x]['correo'].toString() &&
                  pass.text == arrData[x]['password'].toString()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage(name: arrData[x]['nombre'])));
                break;
              } else {
                print('Error el correo o pass esta incorrecto');
                //print(arrData[x]['correo']);
                //print(arrData[x]['password']);
              }
            }

            //print('datassss: ' + arrData.toString());
          },
        );
      },
    );
  }
}
