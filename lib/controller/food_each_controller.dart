// ignore_for_file: file_names

import 'package:fyp/model/food_category_food_list_model.dart';
import 'package:fyp/model/food_each_model.dart';
import 'package:fyp/model/restaurant_food_category_list_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class FoodEachController extends GetxController{
 var foodEach = FoodEachModel(data: []).obs;
   Future getFoodEachDetail(int id) async{
    try{
      var data = await RemoteService.fetchFoodEach(id);
      if(data != null){
        foodEach.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

}
  