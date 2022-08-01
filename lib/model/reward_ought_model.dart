// To parse this JSON data, do
//
//     final rewardBoughtModel = rewardBoughtModelFromJson(jsonString);

import 'dart:convert';

RewardBoughtModel rewardBoughtModelFromJson(String str) => RewardBoughtModel.fromJson(json.decode(str));

String rewardBoughtModelToJson(RewardBoughtModel data) => json.encode(data.toJson());

class RewardBoughtModel {
    RewardBoughtModel({
        required this.data,
    });

    List<Datum> data;

    factory RewardBoughtModel.fromJson(Map<String, dynamic> json) => RewardBoughtModel(
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
        this.status,
        this.userId,
        this.rewardItemId,
        this.restaurantId,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String? finder;
    double? cost;
    String? status;
    int? userId;
    int? rewardItemId;
    dynamic? restaurantId;
    String? createdAt;
    DateTime? updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        finder: json["finder"],
        cost: json["cost"].toDouble(),
        status: json["status"],
        userId: json["user_id"],
        rewardItemId: json["reward_item_id"],
        restaurantId: json["restaurant_id"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id!,
        "name": name!,
        "finder": finder!,
        "cost": cost!,
        "status": status!,
        "user_id": userId!,
        "reward_item_id": rewardItemId!,
        "restaurant_id": restaurantId!,
        "created_at": createdAt!,
        "updated_at": updatedAt!.toIso8601String(),
    };
}
