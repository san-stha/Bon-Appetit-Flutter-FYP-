// To parse this JSON data, do
//
//     final restaurantFoodCategoryListModel = restaurantFoodCategoryListModelFromJson(jsonString);

import 'dart:convert';

RestaurantFoodCategoryListModel restaurantFoodCategoryListModelFromJson(String str) => RestaurantFoodCategoryListModel.fromJson(json.decode(str));

String restaurantFoodCategoryListModelToJson(RestaurantFoodCategoryListModel data) => json.encode(data.toJson());

class RestaurantFoodCategoryListModel {
    RestaurantFoodCategoryListModel({
        required this.data,
    });

    List<Datum> data;

    factory RestaurantFoodCategoryListModel.fromJson(Map<String, dynamic> json) => RestaurantFoodCategoryListModel(
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
        required this.image,
        required this.userId,
    });

    int id;
    String name;
    String? image;
    int userId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "user_id": userId,
    };
}
