// // To parse this JSON data, do
// //
// //     final latLongResModel = latLongResModelFromJson(jsonString);

// import 'dart:convert';

// List<LatLongResModel> latLongResModelFromJson(String str) => List<LatLongResModel>.from(json.decode(str).map((x) => LatLongResModel.fromJson(x)));

// String latLongResModelToJson(List<LatLongResModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class LatLongResModel {
//     LatLongResModel({
//        this.id,
//        this.name,
//        this.address,
//        this.phoneNumber,
//        this.description,
//        this.latitude,
//        this.longitude,
//        this.image,
//        this.restaurantCategoryId,
//        this.userId,
//        this.createdAt,
//        this.updatedAt,
//     });

//     int? id;
//     String? name;
//     String? address;
//     String? phoneNumber;
//     String? description;
//     double? latitude;
//     double? longitude;
//     String? image;
//     int? restaurantCategoryId;
//     int? userId;
//     DateTime? createdAt;
//     DateTime? updatedAt;

//     factory LatLongResModel.fromJson(Map<String, dynamic> json) => LatLongResModel(
//         id: json["id"],
//         name: json["name"],
//         address: json["address"],
//         phoneNumber: json["phone_number"],
//         description: json["description"],
//         latitude: json["latitude"].toDouble(),
//         longitude: json["longitude"].toDouble(),
//         image: json["image"],
//         restaurantCategoryId: json["restaurant_category_id"],
//         userId: json["user_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id!,
//         "name": name!,
//         "address": address!,
//         "phone_number": phoneNumber!,
//         "description": description!,
//         "latitude": latitude!,
//         "longitude": longitude!,
//         "image": image!,
//         "restaurant_category_id": restaurantCategoryId!,
//         "user_id": userId!,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt!.toIso8601String(),
//     };
// }
