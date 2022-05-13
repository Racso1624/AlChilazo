import 'package:alchilazo/register_worker.dart';
import 'package:alchilazo/services_screen.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:flutter/material.dart';
import 'MongoDbModel_Worker.dart';
import 'mongo.dart';

class ViewWorker extends StatefulWidget {
  const ViewWorker({Key? key, required this.trabajo}) : super(key: key);
  final String trabajo;

  @override
  State<ViewWorker> createState() => _ServicesWorkers();
}

class _ServicesWorkers extends State<ViewWorker> {
  
  var arrData = [];
  Future _getData() async {
    arrData = await MongoDatabase.getData_workers();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _getData();
    });
  }

  final String imageUrl = "https://www.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          padding: const EdgeInsets.all(5.5),
          itemCount: arrData.length,
          itemBuilder: _itemBuilder
        )
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index){
    return InkWell(
        child: Container(
          width: 150,
          height: 150,
          padding: const EdgeInsets.all(15.0),
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
              Text("${arrData[index]["name"]}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              SizedBox(
                height: 5,
              ),
              Text("${arrData[index]["phone"]}",
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
        onTap: () {
        },
      );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Encuentra el servicio\nque desees:",
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.25)),
            ]),
          )
        ],
      ),
    );
  }
}