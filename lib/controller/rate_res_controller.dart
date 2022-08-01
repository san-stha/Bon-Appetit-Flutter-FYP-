// ignore_for_file: file_names

import 'package:fyp/model/restauran_list_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class RateResController extends GetxController{
 var rateRes = RestaurantListModel(data: []).obs;
   Future getRateRes(int id) async{
    try{
      var data = await RemoteService.fetchRateRes(id);
      if(data != null){
        rateRes.value = data as RestaurantListModel;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  

}
  