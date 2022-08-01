// To parse this JSON data, do
//
//     final foodCategoryFoodListModel = foodCategoryFoodListModelFromJson(jsonString);

import 'dart:convert';

FoodCategoryFoodListModel foodCategoryFoodListModelFromJson(String str) => FoodCategoryFoodListModel.fromJson(json.decode(str));

String foodCategoryFoodListModelToJson(FoodCategoryFoodListModel data) => json.encode(data.toJson());

class FoodCategoryFoodListModel {
    FoodCategoryFoodListModel({
        required this.data,
    });

    List<Datum> data;

    factory FoodCategoryFoodListModel.fromJson(Map<String, dynamic> json) => FoodCategoryFoodListModel(
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
    });

    int id;
    String name;
    int price;
    String description;
    dynamic image;
    int foodCategoryId;
    int userId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
        foodCategoryId: json["food_category_id"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "image": image,
        "food_category_id": foodCategoryId,
        "user_id": userId,
    };
}
