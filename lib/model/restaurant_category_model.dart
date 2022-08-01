// // To parse this JSON data, do
// //
// //     final restaurantCategoryModel = restaurantCategoryModelFromJson(jsonString);

// import 'dart:convert';

// List<RestaurantCategoryModel> restaurantCategoryModelFromJson(String str) => List<RestaurantCategoryModel>.from(json.decode(str).map((x) => RestaurantCategoryModel.fromJson(x)));

// String restaurantCategoryModelToJson(List<RestaurantCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class RestaurantCategoryModel {
//     RestaurantCategoryModel({
//         required this.id,
//         required this.name,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     int id;
//     String name;
//     DateTime createdAt;
//     DateTime updatedAt;

//     factory RestaurantCategoryModel.fromJson(Map<String, dynamic> json) => RestaurantCategoryModel(
//         id: json["id"],
//         name: json["name"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }

// To parse this JSON data, do
//
//     final restaurantCategoryModel = restaurantCategoryModelFromJson(jsonString);

import 'dart:convert';

RestaurantCategoryModel restaurantCategoryModelFromJson(String str) =>
    RestaurantCategoryModel.fromJson(json.decode(str));

String restaurantCategoryModelToJson(RestaurantCategoryModel data) =>
    json.encode(data.toJson());

class RestaurantCategoryModel {
  RestaurantCategoryModel({
    required this.data,
  });

  List<Datum> data;

  factory RestaurantCategoryModel.fromJson(Map<String, dynamic> json) =>
      RestaurantCategoryModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id!,
        "name": name!,
        "image": image!,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
