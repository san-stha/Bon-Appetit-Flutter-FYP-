// ignore_for_file: file_names

import 'package:fyp/model/restauran_list_model.dart';
import 'package:fyp/model/standard_rating_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class StandardRatingController extends GetxController{
 var standardRating = StandardRatingModel(averageRating: averageRating, totalUsers: totalUsers, reviews: []).obs;

  static var averageRating = 0.0;

  static var totalUsers = 0;


   Future getStandardRating(int id) async{
    try{
      var data = await RemoteService.fetchStandardRating(id);
      if(data != null){
        standardRating.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  

}
  