import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel_Worker mongoDbModelFromJson(String str) =>
    MongoDbModel_Worker.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel_Worker data) => json.encode(data.toJson());

class MongoDbModel_Worker {
  MongoDbModel_Worker({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.descripcion,
    required this.foto_dpi,
    required this.antecedente_penal,
    required this.foto_perfil,
    required this.lista_trabajos
  });

  ObjectId id;
  String name;
  String address;
  String phone;
  String email;
  String descripcion;
  String foto_dpi;
  String antecedente_penal;
  String foto_perfil;
  List lista_trabajos;

  factory MongoDbModel_Worker.fromJson(Map<String, dynamic> json) => MongoDbModel_Worker(
        id: json["_id"],
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        email: json["email"],
        descripcion: json["descripcion"],
        foto_dpi: json["foto_dpi"],
        antecedente_penal: json["antecedente_penal"],
        foto_perfil: json["foto_perfil"],
        lista_trabajos: json["lista_trabajos"]
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "address": address,
        "phone": phone,
        "email": email,
        "descripcion": descripcion,
        "foto_dpi": foto_dpi,
        "antecedente_penal": antecedente_penal,
        "foto_perfil": foto_perfil,
        "lista_trabajos": lista_trabajos
      };
}
