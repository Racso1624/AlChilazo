import 'dart:developer';
import 'package:alchilazo/MongoDbModel_User.dart';
import 'package:alchilazo/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, userCollection, workerCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
    workerCollection = db.collection(WORKER_COLLECTION);
  }

  static Future<String> insert_usuario(MongoDbModel_User data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data insertada";
      } else {
        return "Algo ocurrio";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
