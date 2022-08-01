// To parse this JSON data, do
//
//     final gemsHistoryModel = gemsHistoryModelFromJson(jsonString);

import 'dart:convert';

GemsHistoryModel gemsHistoryModelFromJson(String str) => GemsHistoryModel.fromJson(json.decode(str));

String gemsHistoryModelToJson(GemsHistoryModel data) => json.encode(data.toJson());

class GemsHistoryModel {
    GemsHistoryModel({
        required this.data,
    });

    List<Datum> data;

    factory GemsHistoryModel.fromJson(Map<String, dynamic> json) => GemsHistoryModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.points,
        required this.userId,
        required this.restaurantId,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    int points;
    int userId;
    int restaurantId;
    String createdAt;
    DateTime updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        points: json["points"],
        userId: json["user_id"],
        restaurantId: json["restaurant_id"],
        // createdAt: DateTime.parse(json["created_at"]),
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "points": points,
        "user_id": userId,
        "restaurant_id": restaurantId,
        // "created_at": createdAt.toIso8601String(),
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
    };
}
