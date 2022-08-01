// To parse this JSON data, do
//
//     final rewardItemModel = rewardItemModelFromJson(jsonString);

import 'dart:convert';

RewardItemModel rewardItemModelFromJson(String str) =>
    RewardItemModel.fromJson(json.decode(str));

String rewardItemModelToJson(RewardItemModel data) =>
    json.encode(data.toJson());

class RewardItemModel {
  RewardItemModel({
    required this.data,
  });

  List<Datum> data;

  factory RewardItemModel.fromJson(Map<String, dynamic> json) =>
      RewardItemModel(
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
    this.finder,
    this.cost,
    this.userId,
    this.restaurantId,
    this.image,
  });

  int? id;
  String? name;
  String? finder;
  int? cost;
  dynamic userId;
  dynamic restaurantId;
  String? image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        finder: json["finder"],
        cost: json["cost"],
        userId: json["user_id"],
        restaurantId: json["restaurant_id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id!,
        "name": name!,
        "finder": finder!,
        "cost": cost!,
        "user_id": userId,
        "restaurant_id": restaurantId,
        "image": image!,
      };
}
