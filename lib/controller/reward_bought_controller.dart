// ignore_for_file: file_names

import 'package:fyp/components/error_snackbar.dart';
import 'package:fyp/model/reward_ought_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class RewardBoughtController extends GetxController{
 var rewardBought = RewardBoughtModel(data: []).obs;
  var processing = true.obs;

   Future getRewardBought() async{
    try{
      processing(true);

      var data = await RemoteService.fetchRewardBought();
      if(data != null){
        rewardBought.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      processing(false);
    }
  }

}
  