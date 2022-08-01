// To parse this JSON data, do
//
//     final decSortedFoodModel = decSortedFoodModelFromJson(jsonString);

import 'dart:convert';

DecSortedFoodModel decSortedFoodModelFromJson(String str) => DecSortedFoodModel.fromJson(json.decode(str));

String decSortedFoodModelToJson(DecSortedFoodModel data) => json.encode(data.toJson());

class DecSortedFoodModel {
    DecSortedFoodModel({
        required this.data,
    });

    List<Datum> data;

    factory DecSortedFoodModel.fromJson(Map<String, dynamic> json) => DecSortedFoodModel(
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
        this.price,
        this.description,
        this.image,
        this.foodCategoryId,
        this.userId,
        this.createdAt,
        this.updatedAt,
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
