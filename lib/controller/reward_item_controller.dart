// ignore_for_file: file_names

import 'package:fyp/components/error_snackbar.dart';
import 'package:fyp/model/reward_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class RewardItemController extends GetxController{
  var rewardItemList = RewardItemModel(data: []).obs;
   Future getRewardList() async{
    try{
      var data = await RemoteService.fetchRewardItem();
      if(data != null){
        rewardItemList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      errorSnackbar(e.toString());

    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRewardList();
  }


}
  