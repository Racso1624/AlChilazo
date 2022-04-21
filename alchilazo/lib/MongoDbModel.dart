import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  MongoDbModel({
    required this.id,
    required this.nombre,
    required this.correo,
    required this.password,
    required this.dpi,
  });

  ObjectId id;
  String nombre;
  String correo;
  String password;
  String dpi;

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        id: json["_id"],
        nombre: json["nombre"],
        correo: json["correo"],
        password: json["password"],
        dpi: json["dpi"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "correo": correo,
        "password": password,
        "dpi": dpi,
      };
}
