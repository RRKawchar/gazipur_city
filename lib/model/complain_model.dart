

import 'dart:convert';

List<ComplainModel> complainModelFromJson(String str) => List<ComplainModel>.from(json.decode(str).map((x) => ComplainModel.fromJson(x)));

String complainModelToJson(List<ComplainModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ComplainModel {
  int id;
  String uuid;
  String category;
  String ward;
  dynamic area;
  dynamic road;
  dynamic house;
  String location;
  String description;
  String userId;
  String? pictures;
  DateTime createdAt;
  DateTime updatedAt;

  ComplainModel({
    required this.id,
    required this.uuid,
    required this.category,
    required this.ward,
    this.area,
    this.road,
    this.house,
    required this.location,
    required this.description,
    required this.userId,
    this.pictures,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ComplainModel.fromJson(Map<String, dynamic> json) => ComplainModel(
    id: json["id"],
    uuid: json["uuid"],
    category: json["category"],
    ward: json["ward"],
    area: json["area"],
    road: json["road"],
    house: json["house"],
    location: json["location"],
    description: json["description"],
    userId: json["user_id"],
    pictures: json["pictures"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uuid": uuid,
    "category": category,
    "ward": ward,
    "area": area,
    "road": road,
    "house": house,
    "location": location,
    "description": description,
    "user_id": userId,
    "pictures": pictures,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
