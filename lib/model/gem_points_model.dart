// To parse this JSON data, do
//
//     final gemsPointsModel = gemsPointsModelFromJson(jsonString);

// import 'dart:convert';

// GemsPointsModel gemsPointsModelFromJson(String str) => GemsPointsModel.fromJson(json.decode(str));

// String gemsPointsModelToJson(GemsPointsModel data) => json.encode(data.toJson());

// class GemsPointsModel {
//     GemsPointsModel({
//         required this.points,
//     });

//     String points;

//     factory GemsPointsModel.fromJson(Map<String, dynamic> json) => GemsPointsModel(
//         points: json["points"],
//     );

//     Map<String, dynamic> toJson() => {
//         "points": points,
//     };
// }





// // To parse this JSON data, do
// //
// //     final gemsModel = gemsModelFromJson(jsonString);

// import 'dart:convert';

// GemsModel gemsModelFromJson(String str) => GemsModel.fromJson(json.decode(str));

// String gemsModelToJson(GemsModel data) => json.encode(data.toJson());

// class GemsModel {
//     GemsModel({
//         required this.data,
//     });

//     List<Datum> data;

//     factory GemsModel.fromJson(Map<String, dynamic> json) => GemsModel(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     Datum({
//         this.id,
//         this.points,
//         this.userId,
//         this.restaurantId,
//         this.createdAt,
//         this.updatedAt,
//     });

//     int? id;
//     double? points;
//     int? userId;
//     int? restaurantId;
//     DateTime? createdAt;
//     DateTime? updatedAt;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         points: json["points"].toDouble(),
//         userId: json["user_id"],
//         restaurantId: json["restaurant_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id!,
//         "points": points!,
//         "user_id": userId!,
//         "restaurant_id": restaurantId!,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//     };
// }


// To parse this JSON data, do
//
//     final gemsPointsModel = gemsPointsModelFromJson(jsonString);

import 'dart:convert';

GemsPointsModel gemsPointsModelFromJson(String str) => GemsPointsModel.fromJson(json.decode(str));

String gemsPointsModelToJson(GemsPointsModel data) => json.encode(data.toJson());

class GemsPointsModel {
    GemsPointsModel({
        required this.points,
    });

    double? points;

    factory GemsPointsModel.fromJson(Map<String, dynamic> json) => GemsPointsModel(
        points: json["points"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "points": points!,
    };
}
