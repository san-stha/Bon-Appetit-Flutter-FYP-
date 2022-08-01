// // To parse this JSON data, do
// //
// //     final foodCategoryModel = foodCategoryModelFromJson(jsonString);

// import 'dart:convert';

// List<FoodCategoryModel> foodCategoryModelFromJson(String str) => List<FoodCategoryModel>.from(json.decode(str).map((x) => FoodCategoryModel.fromJson(x)));

// String foodCategoryModelToJson(List<FoodCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class FoodCategoryModel {
//     FoodCategoryModel({
//         required this.id,
//         required this.name,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     int id;
//     String name;
//     DateTime createdAt;
//     DateTime updatedAt;

//     factory FoodCategoryModel.fromJson(Map<String, dynamic> json) => FoodCategoryModel(
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
//     final foodCategoryModel = foodCategoryModelFromJson(jsonString);

import 'dart:convert';

FoodCategoryModel foodCategoryModelFromJson(String str) => FoodCategoryModel.fromJson(json.decode(str));

String foodCategoryModelToJson(FoodCategoryModel data) => json.encode(data.toJson());

class FoodCategoryModel {
    FoodCategoryModel({
        required this.data,
    });

    List<Datum> data;

    factory FoodCategoryModel.fromJson(Map<String, dynamic> json) => FoodCategoryModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.name,
        required this.userId,
    });

    int id;
    String name;
    int userId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "user_id": userId,
    };
}
