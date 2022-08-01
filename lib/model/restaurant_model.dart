// // To parse this JSON data, do
// //
// //     final restaurantModel = restaurantModelFromJson(jsonString);

// import 'dart:convert';

// RestaurantModel restaurantModelFromJson(String str) => RestaurantModel.fromJson(json.decode(str));

// String restaurantModelToJson(RestaurantModel data) => json.encode(data.toJson());

// class RestaurantModel {
//     RestaurantModel({
//         required this.data,
//     });

//     List<Datum> data;

//     factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

// class Datum {
//     Datum({
//         required this.id,
//         required this.name,
//         required this.address,
//         required this.phoneNumber,
//         // required this.description,
//         required this.latitude,
//         required this.longitude,
//         required this.image,
//         required this.userId,
//     });

//     int id;
//     String name;
//     String address;
//     String phoneNumber;
//     // String description;
//     double latitude;
//     double longitude;
//     String image;
//     int userId;

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         name: json["name"],
//         address: json["address"],
//         phoneNumber: json["phone_number"],
//         // description: json["description"] == null ? null : json["description"],
//         latitude: json["latitude"].toDouble(),
//         longitude: json["longitude"].toDouble(),
//         image: json["image"],
//         userId: json["user_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "address": address,
//         "phone_number": phoneNumber,
//         // "description": description == null ? null : description,
//         "latitude": latitude,
//         "longitude": longitude,
//         "image": image,
//         "user_id": userId,
//     };
// }



// To parse this JSON data, do
//
//     final restaurantModel = restaurantModelFromJson(jsonString);

import 'dart:convert';

RestaurantModel restaurantModelFromJson(String str) => RestaurantModel.fromJson(json.decode(str));

String restaurantModelToJson(RestaurantModel data) => json.encode(data.toJson());

class RestaurantModel {
    RestaurantModel({
        required this.data,
    });

    List<Datum> data;

    factory RestaurantModel.fromJson(Map<String, dynamic> json) => RestaurantModel(
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
        required this.address,
        required this.phoneNumber,
        required this.description,
        required this.latitude,
        required this.longitude,
        required this.image,
        required this.userId,
        required this.restaurantCategoryId,
    });

    int? id;
    String? name;
    String? address;
    String? phoneNumber;
    String? description;
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
