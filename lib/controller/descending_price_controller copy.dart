// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fyp/model/desc_sorted_food.dart';
import 'package:fyp/model/food_category_model.dart';
import 'package:fyp/model/food_model.dart';
import 'package:fyp/model/restaurant_category_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class DescendingPriceController extends GetxController{
  var decPriceFoood = DecSortedFoodModel(data: []).obs;
  var processing = true.obs;
   Future getDecPriceFood(int id) async{
    try{

      processing(true);
      var data = await RemoteService.fetchDecPriceFood(id);
      if(data != null){
        decPriceFoood.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      processing(false);
    }
  }
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getDecPriceFood();
  // }


}
  