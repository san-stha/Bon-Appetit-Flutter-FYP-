// To parse this JSON data, do
//
//     final userDetailModel = userDetailModelFromJson(jsonString);

import 'dart:convert';

UserDetailModel userDetailModelFromJson(String str) => UserDetailModel.fromJson(json.decode(str));

String userDetailModelToJson(UserDetailModel data) => json.encode(data.toJson());

class UserDetailModel {
    UserDetailModel({
        this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.character,
        this.emailVerifiedAt,
        this.reputation,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String? email;
    String? phoneNumber;
    String? character;
    dynamic emailVerifiedAt;
    int? reputation;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory UserDetailModel.fromJson(Map<String, dynamic> json) => UserDetailModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        character: json["character"],
        emailVerifiedAt: json["email_verified_at"],
        reputation: json["reputation"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id!,
        "name": name!,
        "email": email!,
        "phone_number": phoneNumber!,
        "character": character!,
        "email_verified_at": emailVerifiedAt,
        "reputation": reputation!,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
