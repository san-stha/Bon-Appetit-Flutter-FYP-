// ignore_for_file: file_names

// import 'package:fyp/model/restaurant_model.dart';
// import 'package:fyp/service/remote_service.dart';
// import 'package:get/get.dart';

// class RestaurantController extends GetxController{
//   var restaurantList = RestaurantModel(data: [data])
//    Future getmyRestaurantList() async{
//     try{
//       var data = await RemoteService.fetchRestaurant();
//       if(data != null){
//         restaurantList.value = data;
//       }
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }
//   @override
//   void onInit() {
//     // TODO: implement onInit
//     super.onInit();
//     getmyRestaurantList();
//   }

// }

// ignore_for_file: file_names

import 'package:fyp/model/food_category_food_list_model.dart';
import 'package:fyp/model/restaurant_food_category_list_model.dart';
import 'package:fyp/model/restaurant_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class RestaurantController extends GetxController {
  var restaurantList = RestaurantModel(data: []).obs;
  RxBool processing = false.obs;
  Future getRestaurant() async {
    try {
      processing.value = true;
      var data = await RemoteService.fetchRestaurant();
      processing.value = false;
      if (data != null) {
        restaurantList.value = data;
      }
    } catch (e) {
      processing.value = false;
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRestaurant();
  }
}
