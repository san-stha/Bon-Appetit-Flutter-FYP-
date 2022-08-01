// ignore_for_file: file_names

import 'package:fyp/model/food_category_model.dart';
import 'package:fyp/model/restaurant_category_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class FoodCategoryController extends GetxController{
  var foodCategoryList = FoodCategoryModel(data: []).obs;
   Future getFoodCategoryList() async{
    try{
      var data = await RemoteService.fetchFoodCategory();
      if(data != null){
        foodCategoryList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFoodCategoryList();
  }


}
  