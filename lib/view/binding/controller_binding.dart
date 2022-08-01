import 'package:fyp/controller/ascending_price_controller.dart';
import 'package:fyp/controller/coupon_controller.dart';
import 'package:fyp/controller/descending_price_controller%20copy.dart';
import 'package:fyp/controller/food_category_controller.dart';
import 'package:fyp/controller/food_category_food_list_controller.dart';
import 'package:fyp/controller/food_controller.dart';
import 'package:fyp/controller/food_each_controller.dart';
import 'package:fyp/controller/gems_history_controller.dart';
import 'package:fyp/controller/gems_points_controller.dart';
import 'package:fyp/controller/lat_long_res_controller.dart';
import 'package:fyp/controller/rate_res_controller.dart';
import 'package:fyp/controller/res_detail_controller.dart';
import 'package:fyp/controller/restaurantController.dart';
import 'package:fyp/controller/restaurant_category_controller.dart';
import 'package:fyp/controller/restaurant_food_category_list_controller.dart';
import 'package:fyp/controller/restaurant_list_controller.dart';
import 'package:fyp/controller/reward_bought_controller.dart';
import 'package:fyp/controller/reward_item_controller.dart';
import 'package:fyp/controller/search_restaurant_controller.dart';
import 'package:fyp/controller/standard_rating_controller.dart';
import 'package:fyp/controller/user_detail_model.dart';
import 'package:fyp/controller/visited_res_controller.dart';
import 'package:get/get.dart';

class ControllerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(RestaurantController());
    Get.put(RestaurantCategoryController());
    Get.put(FoodController());
    Get.put(FoodCategoryController());
    Get.put(CouponController());
    Get.put(RestaurantListController());
    Get.put(RestaurantFoodCategoryListController());
    Get.put(FoodCategoryFoodListController());
    Get.put(GemsHistoryController());
    Get.put(FoodEachController());
    Get.put(RewardItemController());
    Get.put(UserDetailController());
    Get.put(VisitedResController());
    Get.put(RateResController());
    Get.put(StandardRatingController());
    Get.put(AscendingPriceController());
    Get.put(DescendingPriceController());
    Get.put(SearchRestaurantController());
    Get.put(GemsPointsController());
    Get.put(ResDetailController());
    Get.put(RewardBoughtController());
    // Get.put(LatLongResController());
    
  }
  
}