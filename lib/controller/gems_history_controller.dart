// ignore_for_file: file_names

import 'package:fyp/model/gems_model.dart';
import 'package:fyp/model/restauran_list_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class GemsHistoryController extends GetxController{
 var gemsHistory = GemsHistoryModel(data: []).obs;
 var processing = true.obs;
   Future getGemsHistory() async{
    try{
      processing(true);
      var data = await RemoteService.fetchGemsHistory();
      print("data");
      print(data);
      if(data != null){
        gemsHistory.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      processing(false);
    }
  }
  //   @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getGemsHistory();
  // }
  

}
