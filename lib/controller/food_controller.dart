// ignore_for_file: file_names

import 'package:fyp/model/food_category_model.dart';
import 'package:fyp/model/food_model.dart';
import 'package:fyp/model/restaurant_category_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class FoodController extends GetxController{
  var foodList = FoodModel(data: []).obs;
   Future getFoodList() async{
    try{
      var data = await RemoteService.fetchFood();
      if(data != null){
        foodList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFoodList();
  }


}
  