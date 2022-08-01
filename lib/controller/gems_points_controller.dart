// // ignore_for_file: file_names

// import 'package:fyp/const/controllers.dart';
// import 'package:fyp/model/gem_points.dart';
// import 'package:fyp/model/gems_model.dart';
// import 'package:fyp/model/restauran_list_model.dart';
// import 'package:fyp/service/remote_service.dart';
// import 'package:get/get.dart';

// class GemsPointsController extends GetxController{
//  var gemsPoints = GemsPointsModel(points: points.toString()).obs;
//    Future getGemsHistory(int id) async{
//     try{
//       var data = await RemoteService.fetchGemsHistory(4);
//       if(data != null){
//         getGemsHistory.points = data;
//       }
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }
  

// }
  
// ignore_for_file: file_names

// import 'package:fyp/model/gem_points.dart';
// import 'package:fyp/model/reward_model.dart';
// import 'package:fyp/service/remote_service.dart';
// import 'package:get/get.dart';

// class GemsPointsController extends GetxController{
//   var gemsPoints = GemsPointsModel(points: points).obs;

//   static var points;
  
//    Future getGemsPoints() async{
//     try{
//       var data = await RemoteService.fetchGemsPoints();
//       if(data != null){
//         gemsPoints.value = data;
//       }
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }
//   //  @override
//   // void onInit() {
//   //   // TODO: implement onInit
//   //   super.onInit();
//   //   getGemsPoints();
//   // }


// }



import 'package:fyp/model/gem_points_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class GemsPointsController extends GetxController{
    var gemsPoints = GemsPointsModel(points: points).obs;

  static var points = 0.0;


  Future getGemsPoints() async{
    try{
      var data = await RemoteService.fetchGemsPoints();
      if(data != null){
        gemsPoints.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

}
