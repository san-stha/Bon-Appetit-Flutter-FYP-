// To parse this JSON data, do
//
//     final visitedResModel = visitedResModelFromJson(jsonString);

import 'dart:convert';

VisitedResModel visitedResModelFromJson(String str) => VisitedResModel.fromJson(json.decode(str));

String visitedResModelToJson(VisitedResModel data) => json.encode(data.toJson());

class VisitedResModel {
    VisitedResModel({
        required this.data,
    });

    List<Datum> data;

    factory VisitedResModel.fromJson(Map<String, dynamic> json) => VisitedResModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.userId,
        this.resUserId,
    });

    int? userId;
    int? resUserId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        resUserId: json["res_user_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId!,
        "res_user_id": resUserId!,
    };
}
