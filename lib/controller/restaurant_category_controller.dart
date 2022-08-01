
import 'package:fyp/model/restaurant_category_model.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:get/get.dart';

class RestaurantCategoryController extends GetxController{
  var restaurantCategoryList = RestaurantCategoryModel(data: []).obs;
   Future getRestaurantCategoryList() async{
    try{
      var data = await RemoteService.fetchRestaurantCategory();
      if(data != null){
        restaurantCategoryList.value = data;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getRestaurantCategoryList();
  }


}
  