import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/const/controllers.dart';
import 'package:fyp/controller/food_category_food_list_controller.dart';
import 'package:fyp/controller/food_controller.dart';
import 'package:fyp/controller/res_detail_controller.dart';
import 'package:fyp/controller/restaurant_food_category_list_controller.dart';
import 'package:fyp/controller/standard_rating_controller.dart';
import 'package:fyp/view/food_list/food_list.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:fyp/view/global/global.dart' as globals;

class ResturantPage extends StatefulWidget {
  const ResturantPage({Key? key}) : super(key: key);

  @override
  State<ResturantPage> createState() => _ResturantPageState();
}

class _ResturantPageState extends State<ResturantPage> {
  double _ratingStar = 0;
  @override
  Widget build(BuildContext context) {
    // var fc = Get.find<FoodController>();
    var rsfcl = Get.find<RestaurantFoodCategoryListController>();
    var fcfl = Get.find<FoodCategoryFoodListController>();
    var avr = Get.find<StandardRatingController>();
    var rd = Get.find<ResDetailController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(8, 0, 49, 1),
          title: const Text("Resturant"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, 'dashboard');
            },
            icon: Icon(Icons.close),
          ),
        ),
        body: Obx(
          () => rd.processing.value
              ? const Center(child: CupertinoActivityIndicator())
              : rd.resDetail.value.data.isEmpty
                  ? const Center(
                      child: Text("No Restaunrant Details"),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: rd.resDetail.value.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              var mydata = rd.resDetail.value.data[index];
                              return Container(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 140,
                                      child: Image.network(mydata.image!,
                                          fit: BoxFit.cover)),
                                  ListTile(
                                    title: BAPTText(
                                        text: mydata.name.toString(),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    subtitle: BAPTText(
                                      text: mydata.address.toString(),
                                      fontWeight: FontWeight.w300,
                                    ),
                                    trailing: Text(mydata.phoneNumber.toString())
                                  ),
                                ],
                              ));
                            },
                          ),

                          // Expanded(
                          //   child:
                          //   RatingBar.builder(
                          //     updateOnDrag: false,
                          //     ignoreGestures: true,
                          //     itemSize: 20,
                          //     initialRating: avr.avgRating.value.averageRating! + .0,
                          //     // initialRating: 4,
                          //     minRating: 1,
                          //     direction: Axis.horizontal,
                          //     allowHalfRating: true,
                          //     itemCount: 5,
                          //     itemPadding:
                          //         const EdgeInsets.symmetric(horizontal: 2.0),
                          //     itemBuilder: (context, _) => const Icon(
                          //       Icons.star,
                          //       color: Colors.amber,
                          //     ),
                          //     onRatingUpdate: (rating) {
                          //       //   print(rating);
                          //       //   _ratingStar = rating;
                          //       //   print(_ratingStar);
                          //     },
                          //   ),
                          // ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: IgnorePointer(
                                  child: RatingBar.builder(
                                    updateOnDrag: false,
                                    initialRating:
                                        avr.standardRating.value.averageRating!,
                                    // initialRating: 2,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 4.0),
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star_border_rounded,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: BAPTText(
                                      text: "Rated by (" +
                                          avr.standardRating.value.totalUsers
                                              .toString() +
                                          ") users")),
                            ],
                          ),

                          //food categories
                          ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: rsfcl.restaurantsFoodCategoryList.value
                                  .data.length,
                              itemBuilder: (BuildContext context, int index) {
                                var mydata = rsfcl.restaurantsFoodCategoryList
                                    .value.data[index];
                                return Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: InkWell(
                                      onTap: () {
                                        fcfl.getFoodCategoryFoodList(mydata.id);
                                        globals.category_id = mydata.id;
                                        Get.to(() =>
                                            const FoodCategoryFoodListPage());
                                      },
                                      child:
                                          // Card(
                                          //   borderOnForeground: true,
                                          //   color: Colors.grey[200],
                                          //   child: ListTile(
                                          //     title: Text(mydata.name),
                                          //   ),
                                          // ),
                                          Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.elliptical(10, 20),
                                              ),
                                              border: Border.all(
                                                  color: AppSetting
                                                      .secondaryColor)),
                                          child: ListTile(
                                            leading: Container
                                            (width: 60,
                                              child: ClipOval(child: Image.network(mydata.image!.toString(), fit: BoxFit.contain))),
                                            title: BAPTText(
                                              text: mydata.name,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            // subtitle: BAPTText(
                                            //   text: avr.standardRating.value.averageRating
                                            //       .toString(),
                                            // ),
                                            // subtitle: mydata.,
                                            trailing: Icon(
                                              Icons.fastfood_outlined,
                                              color: AppSetting.primaryColor,
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              }),
              
                          // SmoothStarRating(
                          //     allowHalfRating: true,
                          //     // onRatingChanged: (value) {
                          //     //   _ratingStar = value;
                          //     //   print(_ratingStar);
                          //     //   setState(() {});
                          //     // },
                          //     starCount: 5,
                          //     rating: avr.avgRating.value.averageRating!,
                          //     size: 30.0,
                          //     filledIconData: Icons.star_rounded,
                          //     halfFilledIconData: Icons.star_half_rounded,
                          //     color: Colors.amber,
                          //     borderColor: Colors.amber,
                          //     spacing: 0.0),

                          const Padding(
                            padding: const EdgeInsets.all(10),
                            child: BAPTText(
                                text: "Reviews :", fontWeight: FontWeight.bold),
                          ),
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: avr.standardRating.value.reviews.length,
                            itemBuilder: (BuildContext context, int index) {
                              var mydata =
                                  avr.standardRating.value.reviews[index];
                              return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child:
                                      ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    child: Card(
                                      elevation: 0,
                                      shadowColor: Colors.white,
                                      child: ListTile(
                                          tileColor: Colors.grey[200],
                                          leading: const BAPTText(
                                              text: "incognito\n(user)",
                                              fontSize: 10,
                                              ),
                                          title: BAPTText(
                                              text: "\'" + mydata.review.toString() + "\'")),
                                    ),
                                  ));
                            },
                          ),

                          // Container(
                          //   height: 200,
                          //   // width: MediaQuery.of(context).size.width,
                          //   child: CarouselSlider(
                          //     options: CarouselOptions(
                          //       enlargeCenterPage: true,
                          //       autoPlay: true,
                          //     ),
                          //     items: imagesList
                          //         .map(
                          //           (item) => Center(
                          //             child: Image.network(
                          //               item,
                          //               fit: BoxFit.cover,
                          //             ),
                          //           ),
                          //         )
                          //         .toList(),
                          //   ),
                          // ),

                          Divider(),

                          Divider(),

                          // ListView.builder(
                          //     shrinkWrap: true,
                          //     itemCount: fc.foodList.length,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return Card(
                          //         borderOnForeground: true,
                          //         color: Colors.grey[200],
                          //         child: ListTile(
                          //           leading: Padding(
                          //             padding: const EdgeInsets.all(4.0),
                          //             child: Image.network(
                          //                 // fc.foodList[index].image!
                          //                 "https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                          //           ),
                          //           title: Text(fc.foodList[index].name.toString()),
                          //           trailing: Text(
                          //             fc.foodList[index].price.toString(),
                          //             style: TextStyle(color: Colors.green),
                          //           ),
                          //         ),
                          //       );
                          //     }),

                          // Card(
                          //   borderOnForeground: true,
                          //   color: Colors.grey[200],
                          //   child: ListTile(
                          //     leading: Padding(
                          //       padding: const EdgeInsets.all(4.0),
                          //       child: Image.network(
                          //           "https://images.pexels.com/photos/315755/pexels-photo-315755.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                          //     ),
                          //     title: Text("Pizza"),
                          //     trailing: Text(
                          //       "Rs. 1000",
                          //       style: TextStyle(color: Colors.green),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
