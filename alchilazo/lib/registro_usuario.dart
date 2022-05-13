import 'package:alchilazo/pantalla_home.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:alchilazo/mongo.dart';
import 'MongoDbModel_User.dart';

class Registro extends StatefulWidget {
  static String id = 'registro_usuario';

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  //uso para obtener los datos ingreados para subirlo luego a la base de datos
  var name = new TextEditingController();
  var email = new TextEditingController();
  var pass = new TextEditingController();
  var dpi = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Registro"),
        backgroundColor: Color.fromRGBO(248, 216, 74, 1),
      ),
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
            SizedBox(
              height: 25.0,
            ),
            _buttonRegistrar(),
          ],
        ),
      ),
    ));
  }

  Future<void> _insertData(
      String name, String email, String pass, String dpi) async {
    var _id = M.ObjectId();
    final data = MongoDbModel_User(
        id: _id, nombre: name, correo: email, password: pass, dpi: dpi);
    var result = await MongoDatabase.insert_usuario(data);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("INSERTED ID " + _id.$oid)));
    _clearAll();
  }

  Widget _nameTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          controller: name,
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
          controller: email,
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
          controller: pass,
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
          controller: dpi,
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: () {
          _insertData(name.text, email.text, pass.text, dpi.text);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                name: name.text,
                correo: email.text,
              ),
            ),
          );
        },
      );
    });
  }

  void _clearAll() {
    name.text = '';
    email.text = '';
    pass.text = '';
    dpi.text = '';
  }
}
