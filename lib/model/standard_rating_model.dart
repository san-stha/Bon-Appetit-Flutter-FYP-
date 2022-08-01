// To parse this JSON data, do
//
//     final standardRatingModel = standardRatingModelFromJson(jsonString);

import 'dart:convert';

StandardRatingModel standardRatingModelFromJson(String str) => StandardRatingModel.fromJson(json.decode(str));

String standardRatingModelToJson(StandardRatingModel data) => json.encode(data.toJson());

class StandardRatingModel {
    StandardRatingModel({
        required this.averageRating,
        required this.totalUsers,
        required this.reviews,
    });

    double? averageRating = 0.0;
    int? totalUsers = 0;
    List<Review> reviews = [];

    factory StandardRatingModel.fromJson(Map<String, dynamic> json) => StandardRatingModel(
        averageRating: json["averageRating"].toDouble(),
        totalUsers: json["totalUsers"],
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "averageRating": averageRating!,
        "totalUsers": totalUsers!,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    };
}

class Review {
    Review({
        required this.userId,
        required this.review,
    });

    int? userId;
    String? review;

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        userId: json["user_id"],
        review: json["review"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId!,
        "review": review!,
    };
}
