import 'dart:convert';

import 'package:fyp/components/error_snackbar.dart';
import 'package:fyp/components/success_snackbar.dart';
import 'package:fyp/model/coupon_model.dart';
import 'package:fyp/model/desc_sorted_food.dart';
import 'package:fyp/model/food_category_food_list_model.dart';
import 'package:fyp/model/food_category_model.dart';
import 'package:fyp/model/food_each_model.dart';
import 'package:fyp/model/food_model.dart';
import 'package:fyp/model/gem_points_model.dart';
import 'package:fyp/model/gems_model.dart';
import 'package:fyp/model/inc_sorted_food.dart';
import 'package:fyp/model/lat_long_res_model.dart';
import 'package:fyp/model/res_detail_model.dart';
import 'package:fyp/model/restauran_list_model.dart';
import 'package:fyp/model/restaurant_food_category_list_model.dart';
import 'package:fyp/model/restaurant_model.dart';
import 'package:fyp/model/restaurant_category_model.dart';
import 'package:fyp/model/reward_model.dart';
import 'package:fyp/model/reward_ought_model.dart';
import 'package:fyp/model/standard_rating_model.dart';
import 'package:fyp/model/user_detail_model.dart';
import 'package:fyp/model/visited_res_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:great_circle_distance_calculator/great_circle_distance_calculator.dart';

class RemoteService {
  static var client = http.Client();
  static var baseURL = "http://192.168.254.29:8000/api/";

  // static List<LatLongResModel> _resList = [];

  static Future<RestaurantModel?> fetchRestaurant() async {
    try {
      // String url = baseURL + endPoint;
      var response = await client.get(Uri.parse(baseURL + "restaurant"),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return restaurantModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

// Future getData(String endPoint) async {
//     String url = baseURL + endPoint;
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String? token = preferences.getString("token");
//     print(token);

//     var response = await http.get(Uri.parse(url), headers: {
//       'Accept': 'application/json',
//       'Authorization': "Bearer " + token!
//     });
//     return response;
//   }

  static Future<RestaurantCategoryModel?> fetchRestaurantCategory() async {
    try {
      var response = await client.get(Uri.parse(baseURL + "resturantCategory"),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return restaurantCategoryModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<FoodCategoryModel?> fetchFoodCategory() async {
    try {
      var response = await client.get(Uri.parse(baseURL + "foodCategory"),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return foodCategoryModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<FoodModel?> fetchFood() async {
    try {
      var response = await client.get(Uri.parse(baseURL + "food"),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return foodModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<CouponModel?> fetchCoupon() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in coupon points");
      print(token);
      var response = await client.get(Uri.parse(baseURL + "coupons"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      print(response);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return couponModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // the one with ids (state management)
  static Future<RestaurantListModel?> fetchRestaurants(int id) async {
    try {
      var response = await client.get(
          Uri.parse(baseURL + "resturantCategory/$id"),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return restaurantListModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<ResDetailModel?> fetchResDetail(int id) async {
    try {
      var response = await client.get(Uri.parse(baseURL + "resDetail/$id"),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return resDetailModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<RestaurantFoodCategoryListModel?> fetchRestaurantFoodCategories(
      int id) async {
    try {
      var response = await client.get(Uri.parse(baseURL + "restaurant/$id"),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return restaurantFoodCategoryListModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<FoodCategoryFoodListModel?> fetchFoodCategoryFoods(
      int id) async {
    try {
      var response = await client.get(Uri.parse(baseURL + "foodCategory/$id"),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return foodCategoryFoodListModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<FoodEachModel?> fetchFoodEach(int id) async {
    try {
      var response = await client.get(Uri.parse(baseURL + "food/$id"),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return foodEachModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<IncSortedFoodModel?> fetchAscPriceFood(int id) async {
    try {
      // String url = baseURL + endPoint;
      var response = await client.get(Uri.parse(baseURL + "incSortedFood/$id"),
          headers: {"Accept": "application/json"});
      print(response.body);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return incSortedFoodModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<DecSortedFoodModel?> fetchDecPriceFood(int id) async {
    try {
      // String url = baseURL + endPoint;
      var response = await client.get(Uri.parse(baseURL + "decSortedFood/$id"),
          headers: {"Accept": "application/json"});
      print('san');
      print(response.body);

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return decSortedFoodModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<GemsHistoryModel?> fetchGemsHistory() async {
    try {
      var tokenChecker = true.obs;
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in gems history");
      print(token);
      var response =
          await client.get(Uri.parse(baseURL + "gemsHistory"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      if (token == null){
         tokenChecker(false);
      }
      print(response);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return gemsHistoryModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  static Future<RewardItemModel?> fetchRewardItem() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in reward items");
      print(token);
      var response =
          await client.get(Uri.parse(baseURL + "rewardItems"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      print(response);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return rewardItemModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // cart total
  static Future<GemsPointsModel?> fetchGemsPoints() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in gems points");
      print(token);
      var response = await client.get(Uri.parse(baseURL + "gems"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      print(response);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return gemsPointsModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // visited res  (token reqd.)
  static Future<VisitedResModel?> fetchVisitedRes() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in visited res");
      print(token);
      var response = await client.get(Uri.parse(baseURL + "visited"), headers: {
        "Accept": "application/json",
        if (token != null) 'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return visitedResModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // visited res  (token reqd.)
  static Future<RestaurantModel?> fetchSearchedRes(String keyword) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in search res");
      print(token);
      var response =
          await client.get(Uri.parse(baseURL + "search/$keyword"), headers: {
        "Accept": "application/json",
        if (token != null) 'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return restaurantModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

// visited res  (token reqd.)
  static Future<RewardBoughtModel?> fetchRewardBought() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in reward bought res");
      print(token);
      var response =
          await client.get(Uri.parse(baseURL + "rewardBought"), headers: {
        "Accept": "application/json",
        if (token != null) 'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return rewardBoughtModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // rate res  (token reqd.)
  static Future<RestaurantListModel?> fetchRateRes(int id) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in rate res");
      print(token);
      var response = await client
          .get(Uri.parse(baseURL + "rateRestaurants/$id"), headers: {
        "Accept": "application/json",
        if (token != null) 'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return restaurantListModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // rate res  (token reqd.)
  static Future<StandardRatingModel?> fetchStandardRating(int id) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in rate res");
      print(token);
      var response =
          await client.get(Uri.parse(baseURL + "averageRating/$id"), headers: {
        "Accept": "application/json",
        if (token != null) 'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return standardRatingModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // cart items
  static Future<UserDetailModel?> fetchUserDetail() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString("token");
      print("this is token in user");
      print(token);
      var response = await client.get(Uri.parse(baseURL + "user"), headers: {
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      });
      // var response =
      //     await client.get(Uri.parse(baseURL + "cart/$id"), headers: {
      //   'Accept': 'application/json',
      // },
      // );
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return userDetailModelFromJson(jsonString);
      } else {
        return null;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  // posting data
  static Future postData(String endPoint, Map data) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString("token");
      // "$baseURL"
      var response = await client.post(Uri.parse(baseURL + endPoint),
          headers: {
            'Content-type': 'application/json',
            'accept': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: jsonEncode(data));
      print(response.body);
      if (response.statusCode == 201 || response.statusCode == 200) {
        var result = json.decode(response.body);
        // Get.snackbar("Message", result['message']);
        successSnackbar(result['message']);
      } else {
        errorSnackbar("Please enter review too!");
        // Get.snackbar("Message", "error");
      }
    } catch (e) {
      Get.snackbar("Message", e.toString());
    }
  }

  // deleting data
  static Future deleteData(String endPoint) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      var token = preferences.getString("token");
      // "$baseURL"
      var response =
          await client.delete(Uri.parse(baseURL + endPoint), headers: {
        'Content-type': 'application/json',
        'accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 201 || response.statusCode == 200) {
        var result = json.decode(response.body);
        Get.snackbar("Message", result['message']);
      } else {
        Get.snackbar("Message", "error");
      }
    } catch (e) {
      Get.snackbar("Message", e.toString());
    }
  }

  // static Future<List<LatLongResModel>?> fetchLatLongList(
  //     double lat, double long) async {
  //   final latitude = lat;
  //   final longitude = long;

  //   try {
  //     // String url = baseURL + endPoint;
  //     var response = await client.get(Uri.parse(baseURL + "latLongRes"),
  //         headers: {"Accept": "application/json"});
  //     final apiRes = json.decode(response.body)
  //      as Map<String, dynamic>;
  //      final apiResList = apiRes['data'] as List;
  //      print('api rest list');
  //      print(apiResList);
  //      print(apiResList);

  //     if (response.statusCode == 200) {
  //       var jsonString = response.body;
  //       final List<LatLongResModel> eachRes = [];
  //       print(apiResList.length);
  //       for(var i = 0; i < apiResList.length ; i++) {
  //         // print('data anme');
  //         // print(data);
  //         // print(data['name']);
  //         // print(data['address']);
  //         // print(data['phone_number']);
  //         // print(data['latitude']);
  //         // print(data['longitude']);

  //         print(apiResList[i]['name']);
  //         eachRes.add(LatLongResModel(
  //           name: apiResList[i]['name'],
  //           address: apiResList[i]['address'],
  //           phoneNumber: apiResList[i]['phone_number'],
  //           description: apiResList[i]['description'],
  //           latitude: double.parse(apiResList[i]['latitude']),
  //           longitude: double.parse(apiResList[i]['longitude']),
  //           image: apiResList[i]['image'],
  //           restaurantCategoryId: apiResList[i]['restaurant_category_id'],
  //           userId: apiResList[i]['user_id'],
  //         ));
  //         print("check");
  //       };
  //       _resList = eachRes;
  //       print('_resList');
  //       print(_resList);
  //       sortRestaurants(_resList, latitude, longitude);
  //       return latLongResModelFromJson(jsonString);
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   }
  // }

  // List _sortedList = [];
  // static void sortRestaurants(list, latitude, longitude) {
  //   var lat = latitude;
  //   var long = longitude;

  // List _sortedList = [];
  // static void sortRestaurants(list, latitude, longitude) {
  //   var lat = latitude;
  //   var long = longitude;
  //   _resList = list;

  //   _resList.sort((firstHosp, secondHosp) {
  //     final gcd1 = GreatCircleDistance.fromDegrees(
  //         latitude1: lat,
  //         longitude1: long,
  //         latitude2: firstHosp.latitude,
  //         longitude2: firstHosp.longitude);
  //     final gcd2 = GreatCircleDistance.fromDegrees(
  //         latitude1: lat,
  //         longitude1: long,
  //         latitude2: secondHosp.latitude,
  //         longitude2: secondHosp.longitude);

  //     // firstHosp.distance = haversine1.haversineDistance();
  //     // secondHosp.distance = haversine2.haversineDistance();
  //     double distance1 = gcd1.haversineDistance();
  //     double distance2 = gcd2.haversineDistance();
  //     return distance1.compareTo(distance2);
  //     // return firstHosp.distance.compareTo(secondHosp.distance);
  //   });
  // }
}
