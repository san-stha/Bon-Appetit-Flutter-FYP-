// To parse this JSON data, do
//
//     final resDetailModel = resDetailModelFromJson(jsonString);

import 'dart:convert';

ResDetailModel resDetailModelFromJson(String str) => ResDetailModel.fromJson(json.decode(str));

String resDetailModelToJson(ResDetailModel data) => json.encode(data.toJson());

class ResDetailModel {
    ResDetailModel({
        required this.data,
    });

    List<Datum> data;

    factory ResDetailModel.fromJson(Map<String, dynamic> json) => ResDetailModel(
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
        this.address,
        this.phoneNumber,
        this.description,
        this.latitude,
        this.longitude,
        this.image,
        this.userId,
        this.restaurantCategoryId,
    });

    int? id;
    String? name;
    String? address;
    String? phoneNumber;
    dynamic? description;
    double? latitude;
    double? longitude;
    String? image;
    int? userId;
    int? restaurantCategoryId;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phoneNumber: json["phone_number"],
        description: json["description"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        image: json["image"],
        userId: json["user_id"],
        restaurantCategoryId: json["restaurant_category_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id!,
        "name": name!,
        "address": address!,
        "phone_number": phoneNumber!,
        "description": description!,
        "latitude": latitude!,
        "longitude": longitude!,
        "image": image!,
        "user_id": userId!,
        "restaurant_category_id": restaurantCategoryId!,
    };
}
