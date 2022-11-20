import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel_Order mongoDbModelFromJson(String str) => // coverage:ignore-line
    MongoDbModel_Order.fromJson(json.decode(str)); // coverage:ignore-line

String mongoDbModelToJson(MongoDbModel_Order data) => // coverage:ignore-line
    json.encode(data.toJson()); // coverage:ignore-line

class MongoDbModel_Order {
  MongoDbModel_Order({
    this.id,
    this.worker_id,
    this.title,
    this.description,
    this.latitud,
    this.longitud,
  });

  ObjectId id;
  ObjectId worker_id;
  String title;
  String description;
  double latitud;
  double longitud;

  factory MongoDbModel_Order.fromJson(
          Map<String, dynamic> json) => // coverage:ignore-line
      MongoDbModel_Order(
        // coverage:ignore-line
        id: json["_id"], // coverage:ignore-line
        worker_id: json["worker_id"],
        title: json["title"], // coverage:ignore-line
        description: json["description"], // coverage:ignore-line
        latitud: json["latitud"], // coverage:ignore-line
        longitud: json["longitud"], // coverage:ignore-line
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "worker_id": worker_id,
        "name": title,
        "address": description,
        "latitud": latitud,
        "longitud": longitud,
      };
}
