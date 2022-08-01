// ignore_for_file: file_names

import 'package:fyp/model/restauran_list_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class RestaurantListController extends GetxController{
 var restaurants = RestaurantListModel(data: []).obs;
   Future getRestaurantList(int id) async{
    try{
      var data = await RemoteService.fetchRestaurants(id);
      if(data != null){
        restaurants.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  

}
  