// ignore_for_file: file_names

import 'package:fyp/model/restauran_list_model.dart';
import 'package:fyp/model/user_detail_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class UserDetailController extends GetxController{
 var userDetail = UserDetailModel().obs;
   var loading = true.obs;
   Future getUserDetal() async{
    try{
      loading(true);
      var data = await RemoteService.fetchUserDetail();
      if(data != null){
        userDetail.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      loading(false);
    }
  }
  //   @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getUserDetal();
  // }

}
  