// ignore_for_file: file_names

import 'package:fyp/model/coupon_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class CouponController extends GetxController{
  var couponList = CouponModel(data: []).obs;
  var processing = true.obs;
   Future getCouponList() async{
    try{
      processing(true);
      var data = await RemoteService.fetchCoupon();
      if(data != null){
        couponList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    finally{
      processing(false);
    }
  }

}
  