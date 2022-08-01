// ignore_for_file: file_names

import 'package:fyp/model/food_category_food_list_model.dart';
import 'package:fyp/model/restaurant_food_category_list_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class FoodCategoryFoodListController extends GetxController{
 var foodCategoryFoodList = FoodCategoryFoodListModel(data: []).obs;
   Future getFoodCategoryFoodList(int id) async{
    try{
      var data = await RemoteService.fetchFoodCategoryFoods(id);
      if(data != null){
        foodCategoryFoodList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

}
  