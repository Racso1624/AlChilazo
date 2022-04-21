import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel_User mongoDbModel_UserToFromJson(String str) =>
    MongoDbModel_User.fromJson(json.decode(str));

String mongoDbModel_UserToJson(MongoDbModel_User data) =>
    json.encode(data.toJson());

class MongoDbModel_User {
  MongoDbModel_User({
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

  factory MongoDbModel_User.fromJson(Map<String, dynamic> json) =>
      MongoDbModel_User(
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
