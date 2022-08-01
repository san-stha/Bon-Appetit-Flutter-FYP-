// To parse this JSON data, do
//
//     final couponModel = couponModelFromJson(jsonString);

import 'dart:convert';

CouponModel couponModelFromJson(String str) => CouponModel.fromJson(json.decode(str));

String couponModelToJson(CouponModel data) => json.encode(data.toJson());

class CouponModel {
    CouponModel({
        required this.data,
    });

    List<Datum> data;

    factory CouponModel.fromJson(Map<String, dynamic> json) => CouponModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.code,
        this.percentOff,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? code;
    double? percentOff;
    String? createdAt;
    DateTime? updatedAt;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        code: json["code"],
        percentOff: json["percent_off"].toDouble(),
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id!,
        "code": code!,
        "percent_off": percentOff!,
        "created_at": createdAt!,
        "updated_at": updatedAt!.toIso8601String(),
    };
}
