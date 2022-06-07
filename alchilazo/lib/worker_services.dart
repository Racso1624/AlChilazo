import 'package:alchilazo/pantalla_home.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:alchilazo/mongo.dart';
import 'MongoDbModel_User.dart';

class Servicios_Trabajador extends StatefulWidget {

  @override
  State<Servicios_Trabajador> createState() => _ServiciosTrabajador();
}

class _ServiciosTrabajador extends State<Servicios_Trabajador> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Servicios para Ofrecer"),
        backgroundColor: Color.fromRGBO(245, 71, 72, 1),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CardListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardListView extends StatelessWidget {
  const CardListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, right: 25.0, bottom: 15.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 300,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Card(
                "Electricista",
                "https://www.lecciona.com/wp-content/uploads/2020/11/ELECTRICISTA.jpg",
                ""),
            Card(
                "Jardineria",
                "https://media.istockphoto.com/photos/garden-worker-trimming-plants-picture-id1166203849?k=20&m=1166203849&s=612x612&w=0&h=UVoI3c9o4DljCFxpRpJznJE5zONRgo9sxeyysO7xVZw=",
                ""),
            Card(
                "Plomeria",
                "https://www.albaniles.org/wp-content/uploads/2016/08/plomero1-1024x713.jpg",
                ""),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;

  Card(this.text, this.imageUrl, this.subtitle, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 15),
      child: new InkWell(
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(10, 20),
                  blurRadius: 10,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.05)),
            ],
          ),
          child: Column(
            children: [
              Image.network(imageUrl, height: 70, fit: BoxFit.cover),
              Spacer(),
              Text(text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              SizedBox(
                height: 5,
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}