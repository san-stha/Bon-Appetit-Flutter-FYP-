// // ignore_for_file: file_names

// import 'package:fyp/model/coupon_model.dart';
// import 'package:fyp/model/lat_long_res_model.dart';
// import 'package:fyp/service/remote_service.dart';
// import 'package:get/get.dart';

// class LatLongResController extends GetxController{
//   var latLongList = <LatLongResModel> [].obs;
//    Future getLatLongList(double lat, double long) async{
//     try{
//       var data = await RemoteService.fetchLatLongList(lat, long);
//       if(data != null){
//         latLongList.value = data;
//       }
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }
//   // @override
//   // void onInit() {
//   //   // TODO: implement onInit
//   //   super.onInit();
//   //   getLatLongList();
//   // }


// }
  