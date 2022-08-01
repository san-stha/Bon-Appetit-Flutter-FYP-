// ignore_for_file: file_names

import 'package:fyp/model/res_detail_model.dart';
import 'package:fyp/model/restauran_list_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class ResDetailController extends GetxController {
  var resDetail = ResDetailModel(data: []).obs;
  var processing = true.obs;

  Future getResDetail(int id) async {
    try {
      processing(true);

      var data = await RemoteService.fetchResDetail(id);
      if (data != null) {
        resDetail.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      processing(false);
    }
  }
}
