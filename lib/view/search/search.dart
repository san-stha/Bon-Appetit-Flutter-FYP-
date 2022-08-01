// import 'package:flutter/material.dart';
// import 'package:fyp/components/bapt_text.dart';
// import 'package:fyp/const/app_settings.dart';
// import 'package:fyp/const/controllers.dart';
// import 'package:fyp/controller/search_restaurant_controller.dart';
// import 'package:fyp/view/search_result/search.dart';
// import 'package:get/get.dart';
// import 'package:anim_search_bar/anim_search_bar.dart';

// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   @override
//   Widget build(BuildContext context) {
//     var sr = Get.find<SearchRestaurantController>();
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 40),
//       child: AnimSearchBar(
//         color: Colors.white,
//         helpText: "Search restaurants . . .",
//         width: MediaQuery.of(context).size.width,
//         textController: textController,
//         onSuffixTap: () {
//           // setState(
//           //   () {
//           //     textController.clear();
//           //   },
//           // );
//           sr.getSearchedRes(textController.text);
//           Get.to(() => const SearchResult());
//         },
//         suffixIcon: Icon(Icons.search),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/components/error_snackbar.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/controller/food_category_food_list_controller.dart';
import 'package:fyp/controller/restaurant_category_controller.dart';
import 'package:fyp/controller/restaurant_food_category_list_controller.dart';
import 'package:fyp/controller/restaurant_list_controller.dart';
import 'package:fyp/controller/search_restaurant_controller.dart';
import 'package:fyp/view/food_list/food_list.dart';
import 'package:fyp/view/restaurant_list.dart/restaurant_list.dart';
import 'package:fyp/view/search_result/search_result.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:fyp/view/global/global.dart' as globals;

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cl = Get.find<RestaurantFoodCategoryListController>();
    var fcfl = Get.find<FoodCategoryFoodListController>();
    var sr = Get.find<SearchRestaurantController>();
    var rc = Get.find<RestaurantListController>();
    var rcat = Get.find<RestaurantCategoryController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppSetting.primaryColor,
        title: const Text("Search"),
        centerTitle: true,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .20,
                    left: 10,
                    right: 10),
                child: OutlineSearchBar(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  elevation: 10,
                  // keyboardType: TextInputType.text,
                  // backgroundColor: Colors.red,
                  hintText: "Search restaurants . . . . . . . . ",
                  // borderColor: AppSetting.primaryColor,
                  borderColor: Colors.white,
                  borderWidth: 4,
                  searchButtonIconColor: AppSetting.primaryColor,
                  clearButtonColor: AppSetting.secondaryColor,
                  // onTap: ,
                  onSearchButtonPressed: (value) {
                    print(value);
                    if ((value).isEmpty) {
                      errorSnackbar("Please insert search word!");
                    } else {
                      sr.getSearchedRes(value);
                      Get.to(() => const SearchResult());
                    }
                    // sr.getSearchedRes(value);
                    // Get.to(() => const SearchResult());
                  },
                ),
              ),
              // const Ba(
              //   'Categories:',
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              // ),
              SizedBox(height: 40),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  // color: Colors.white,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: rcat.restaurantCategoryList.value.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var mydata =
                            rcat.restaurantCategoryList.value.data[index];
                        return InkWell(
                          // onTap: () {

                          //   // plc.getProductListCategory(
                          //   //     cat.categoryList.value.data[index].id);
                          //   fcfl.getFoodCategoryFoodList(mydata.id!);
                          //   globals.category_id = mydata.id!;
                          //   Get.to(() => const FoodCategoryFoodListPage());
                          // },

                          onTap: () {
                            rc.getRestaurantList(rcat
                                .restaurantCategoryList.value.data[index].id!);
                            Get.to(() => const RestaurantListPage());
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 26, vertical: 10),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppSetting.secondaryColor,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(40)),
                                  child: GFAvatar(
                                      maxRadius: 34,
                                      // size: GFSize.LARGE,
                                      backgroundImage:
                                          NetworkImage(mydata.image.toString()),
                                      shape: GFAvatarShape.circle),
                                ),
                                Text(mydata.name.toString()),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
