// ignore_for_file: file_names

import 'package:fyp/model/food_category_food_list_model.dart';
import 'package:fyp/model/food_each_model.dart';
import 'package:fyp/model/restaurant_food_category_list_model.dart';
import 'package:fyp/model/restaurant_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class SearchRestaurantController extends GetxController {
  var searchRes = RestaurantModel(data: []).obs;
  var processing = true.obs;
  Future getSearchedRes(String keyword) async {
    try {
      processing(true);

      var data = await RemoteService.fetchSearchedRes(keyword);
      if (data != null) {
        searchRes.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      processing(false);
    }
  }
}
