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
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(245, 71, 72, 1),
          Color.fromRGBO(245, 71, 72, 20)
        ], begin: Alignment.topLeft, end: Alignment.centerRight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 34.0, horizontal: 140.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    './images/logo-chile.png',
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Iniciar Sesión",
                      style: TextStyle(
                        color: Color.fromRGBO(25, 1, 1, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    _userTextField(),
                    const SizedBox(
                      height: 40,
                    ),
                    _userPassword(),
                    const SizedBox(
                      height: 60,
                    ),
                    _buttonLogin(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    )));
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          controller: name,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: const Icon(Icons.email),
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
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: TextField(
          controller: pass,
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.grey[200],
            prefixIcon: const Icon(Icons.lock),
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
        return ElevatedButton(
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 100.0, vertical: 25.0),
            child: const Text('Iniciar sesión'),
          ),
          style: ElevatedButton.styleFrom(
            primary: const Color.fromRGBO(245, 71, 72, 1),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
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
                        builder: (context) => HomePage(
                            name: arrData[x]['nombre'],
                            correo: arrData[x]['correo'])));
                break;
              }
            }
          },
        );
      },
    );
  }
}
