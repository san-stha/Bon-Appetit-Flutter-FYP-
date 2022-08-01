// ignore_for_file: file_names

import 'package:fyp/model/food_category_model.dart';
import 'package:fyp/model/food_model.dart';
import 'package:fyp/model/inc_sorted_food.dart';
import 'package:fyp/model/restaurant_category_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class AscendingPriceController extends GetxController{
  var ascPriceFoood = IncSortedFoodModel(data: []).obs;
  var processing = true.obs;
   Future getAscPriceFood(int id) async{
    try{
      processing(true);
      var data = await RemoteService.fetchAscPriceFood(id);
      processing.value = false;
      
      if(data != null){
        ascPriceFoood.value = data;
      }
    } catch (e) {
      processing.value = false;
      Get.snackbar("Error", e.toString());
    }
    finally{
      processing(false);
    }
  }
}
  