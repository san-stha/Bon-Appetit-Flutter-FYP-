// ignore_for_file: file_names

import 'package:fyp/model/gems_model.dart';
import 'package:fyp/model/restauran_list_model.dart';
import 'package:fyp/model/visited_res_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class VisitedResController extends GetxController {
  var visitedRes = VisitedResModel(data: []).obs;
  var processing = true.obs;
  Future getVisitedRes() async {
    try {
      processing(true);
      var data = await RemoteService.fetchVisitedRes();
      if (data != null) {
        visitedRes.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      processing(false);
    }
  }
  //   @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  //   getVisitedRes();
  // }

}
