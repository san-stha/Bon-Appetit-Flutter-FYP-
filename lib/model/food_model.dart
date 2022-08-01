// // To parse this JSON data, do
// //
// //     final foodModel = foodModelFromJson(jsonString);

// import 'dart:convert';

// List<FoodModel> foodModelFromJson(String str) => List<FoodModel>.from(json.decode(str).map((x) => FoodModel.fromJson(x)));

// String foodModelToJson(List<FoodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class FoodModel {
//     FoodModel({
//         this.id,
//         this.name,
//         this.price,
//         this.description,
//         this.image,
//         this.foodCategoryId,
//         this.userId,
//         this.createdAt,
//         this.updatedAt,
//     });

//     int? id;
//     String? name;
//     double? price;
//     String? description;
//     String? image;
//     int? foodCategoryId;
//     int? userId;
//     DateTime? createdAt;
//     DateTime? updatedAt;

//     factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
//         id: json["id"],
//         name: json["name"],
//         price: json["price"].toDouble(),
//         description: json["description"] == null ? null : json["description"],
//         image: json["image"] == null ? null : json["image"],
//         foodCategoryId: json["food_category_id"],
//         userId: json["user_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id!,
//         "name": name!,
//         "price": price!,
//         "description": description == null ? null : description,
//         "image": image == null ? null : image,
//         "food_category_id": foodCategoryId!,
//         "user_id": userId!,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//     };
// }



// To parse this JSON data, do
//
//     final foodModel = foodModelFromJson(jsonString);

import 'dart:convert';

FoodModel foodModelFromJson(String str) => FoodModel.fromJson(json.decode(str));

String foodModelToJson(FoodModel data) => json.encode(data.toJson());

class FoodModel {
    FoodModel({
        required this.data,
    });

    List<Datum> data;

    factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
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
        required this.price,
        required this.description,
        required this.image,
        required this.foodCategoryId,
        required this.userId,
        required this.createdAt,
        required this.updatedAt,
    });

    int? id;
    String? name;
    double? price;
    String? description;
    String? image;
    int? foodCategoryId;
    int? userId;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        description: json["description"],
        image: json["image"],
        foodCategoryId: json["food_category_id"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id!,
        "name": name!,
        "price": price!,
        "description": description!,
        "image": image!,
        "food_category_id": foodCategoryId!,
        "user_id": userId!,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
