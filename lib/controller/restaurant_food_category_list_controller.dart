// ignore_for_file: file_names

import 'package:fyp/model/restaurant_food_category_list_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class RestaurantFoodCategoryListController extends GetxController{
 var restaurantsFoodCategoryList = RestaurantFoodCategoryListModel(data: []).obs;
   Future getRestaurantFoodCategoryList(int id) async{
    try{
      var data = await RemoteService.fetchRestaurantFoodCategories(id);
      if(data != null){
        restaurantsFoodCategoryList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

}
  