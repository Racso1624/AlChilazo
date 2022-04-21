// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:alchilazo/MongoDbModel.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:alchilazo/mongo.dart';

class MondoDbInsert extends StatefulWidget {
  MondoDbInsert({Key? key}) : super(key: key);

  @override
  State<MondoDbInsert> createState() => _MondoDbInsertState();
}

class _MondoDbInsertState extends State<MondoDbInsert> {
  var nameController = new TextEditingController();
  var emailController = new TextEditingController();
  var passController = new TextEditingController();
  var dpiController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              'Inserta data',
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "correo"),
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(labelText: "password"),
            ),
            TextField(
              controller: dpiController,
              decoration: InputDecoration(labelText: "dpi"),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlineButton(
                  onPressed: () {
                    _fakeData();
                  },
                  child: Text("Generar data"),
                ),
                ElevatedButton(
                    onPressed: () {
                      _insertData(nameController.text, emailController.text,
                          passController.text, dpiController.text);
                    },
                    child: Text('Insertar')),
              ],
            )
          ],
        ),
      )),
    );
  }

  Future<void> _insertData(
      String name, String email, String pass, String dpi) async {
    var _id = M.ObjectId();
    final data = MongoDbModel(
        id: _id, nombre: name, correo: email, password: pass, dpi: dpi);
    var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("ISERTED ID " + _id.$oid)));
    _clearAll();
  }

  void _clearAll() {
    nameController.text = '';
    emailController.text = '';
    passController.text = '';
    dpiController.text = '';
  }

  void _fakeData() {
    setState(() {
      nameController.text = faker.person.firstName();
      emailController.text = faker.internet.email();
      passController.text = faker.person.firstName();
      dpiController.text = random.decimal().toString();
    });
  }
}
