import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/components/my_drawer.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/controller/food_controller.dart';
import 'package:fyp/controller/res_detail_controller.dart';
import 'package:fyp/controller/restaurantController.dart';
import 'package:fyp/controller/restaurant_food_category_list_controller.dart';
import 'package:fyp/controller/restaurant_list_controller.dart';
import 'package:fyp/controller/standard_rating_controller.dart';
import 'package:fyp/view/restaurant_details/restaurant_details.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  @override
  Widget build(BuildContext context) {
    var rstl = Get.find<RestaurantListController>();
    var rsfcl = Get.find<RestaurantFoodCategoryListController>();
    var avgr = Get.find<StandardRatingController>();
    var rd = Get.find<ResDetailController>();

    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          actions: [
            TextButton.icon(
                // <-- TextButton
                onPressed: () {},
                //Icon(FontAwesomeIcons.ticketAlt)
                icon: const Icon(
                  FontAwesomeIcons.gem,
                  color: Color.fromRGBO(37, 126, 2, 1),
                  size: 20.0,
                ),
                label: BAPTText(
                  text: "10",
                  color: Color.fromRGBO(37, 126, 2, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
          ],
          backgroundColor: Color.fromRGBO(8, 0, 49, 1),
          title: const Text("Restaurants"),
          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: Icon(Icons.close),
          // ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //     children: [
                //       Expanded(
                //         flex: 2,
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Text(
                //             "Resturants",
                //             style: TextStyle(
                //                 fontWeight: FontWeight.bold, fontSize: 17),
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         flex: 2,
                //         child: BAPTText(text: rstl.restaurants.value.data.restaurantCategoryId.toString())
                //       ),
                //     ],
                //   ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: rstl.restaurants.value.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var mydata = rstl.restaurants.value.data[index];
                        //   return  GFCard(
                        //   boxFit: BoxFit.cover,
                        //   // image: Image(image: NetworkImage(mydata.image.toString())),
                        //   title: GFListTile(

                        //     avatar: GFAvatar(
                        //       backgroundImage: AssetImage('your asset image'),
                        //     ),
                        //     title: Text('Card Title'),
                        //     subTitle: Text('Card Sub Title'),
                        //   ),
                        //   content: Image.network(mydata.image.toString()),
                        //   buttonBar: GFButtonBar(
                        //     children: <Widget>[
                        //       GFButton(
                        //         onPressed: () {},
                        //         text: 'Buy',
                        //       ),
                        //       GFButton(
                        //         onPressed: () {},
                        //         text: 'Cancel',
                        //       ),
                        //     ],
                        //   ),
                        // );

                        return Stack(
                          children: [
                          Column(
                            children: [
                              Card(
                                child: Container(
                                  child: InkWell(
                                    onTap: () {
                                      // Navigator.pushNamed(
                                      //     context, 'restaurantDetails');
                                      rsfcl.getRestaurantFoodCategoryList(rstl
                                          .restaurants
                                          .value
                                          .data[index]
                                          .userId);
                                      print(rstl
                                          .restaurants.value.data[index].id);
                                      avgr.getStandardRating(mydata.userId);
                                      rd.getResDetail(mydata.userId);
                                      Get.to(() => const ResturantPage());
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Container(
                                        //   decoration: const BoxDecoration(
                                        //     // image: DecorationImage(image:
                                        //     // NetworkImage("https://images.pexels.com/photos/11319741/pexels-photo-11319741.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
                                        //     // ,
                                        //     // fit: BoxFit.contain,),
                                        //     // shape: BoxShape.rectangle
                                        //   ),
                                        //   child: Image.network("https://images.pexels.com/photos/11319741/pexels-photo-11319741.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                                        //   ),

                                        //       // Image.asset('images/product.jpg'),
                                        //       // NetworkImage()
                                        //       // Image.network(rc.restaurantList[index].image),
                                        //       // NetworkImage(rc.restaurantList[index].image);

                                        //     //  : NetworkImage(rc.restaurantList[index].image.toString());
                                        // ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 140,
                                            child: Image.network(mydata.image,
                                                fit: BoxFit.cover)),
                                        ListTile(
                                          // title: Text(rstl
                                          //     .restaurants.value.data[index].name
                                          //     .toString()),
                                          title: BAPTText(
                                              text: rstl.restaurants.value
                                                  .data[index].name
                                                  .toString(),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          subtitle: BAPTText(
                                            text: rstl.restaurants.value
                                                .data[index].address
                                                .toString(),
                                            fontWeight: FontWeight.w300,
                                          ),
                                          // trailing: Icon(Icons.restaurant,
                                          //     color: Colors.black),
                                        ),
                                        // Padding(
                                        //   padding: const EdgeInsets.only(left: 10),
                                        //   child: RatingBar.builder(
                                        //     updateOnDrag: false,
                                        //     ignoreGestures: true,
                                        //     itemSize: 20,
                                        //     initialRating: 3.5,
                                        //     // initialRating: 4,
                                        //     minRating: 1,
                                        //     direction: Axis.horizontal,
                                        //     allowHalfRating: true,
                                        //     itemCount: 5,
                                        //     itemPadding: const EdgeInsets.symmetric(
                                        //         horizontal: 2.0),
                                        //     itemBuilder: (context, _) => const Icon(
                                        //       Icons.star,
                                        //       color: Colors.amber,
                                        //     ),
                                        //     onRatingUpdate: (rating) {
                                        //       print(rating);
                                        //     },
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Positioned(
                          //   top: 110,
                          //   right: 20,
                          //   child: Container(
                          //     width: 60,
                          //     height: 60,
                          //     decoration: const BoxDecoration(
                          //       color: AppSetting.ancentColor,
                          //       shape: BoxShape.circle,
                          //       boxShadow: const [
                          //         // color: Colors.white, //background color of box
                          //         BoxShadow(
                          //           color: Colors.black,
                          //           blurRadius: 6.0, // soften the shadow
                          //           spreadRadius: 0, //extend the shadow
                          //           offset: Offset(
                          //             0, // Move to right 10  horizontally
                          //             0, // Move to bottom 10 Vertically
                          //           ),
                          //         )
                          //       ],
                          //     ),
                          //     child: const Icon(Icons.restaurant),
                          //   ),
                          // ),
                        ]);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
