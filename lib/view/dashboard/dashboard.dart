import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/components/error_snackbar.dart';
import 'package:fyp/components/my_drawer.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/controller/food_controller.dart';
import 'package:fyp/controller/gems_history_controller.dart';
import 'package:fyp/controller/gems_points_controller.dart';
import 'package:fyp/controller/res_detail_controller.dart';
import 'package:fyp/controller/restaurantController.dart';
import 'package:fyp/controller/restaurant_category_controller.dart';
import 'package:fyp/controller/restaurant_food_category_list_controller.dart';
import 'package:fyp/controller/restaurant_list_controller.dart';
import 'package:fyp/controller/search_restaurant_controller.dart';
import 'package:fyp/controller/standard_rating_controller.dart';
import 'package:fyp/controller/user_detail_model.dart';
import 'package:fyp/controller/visited_res_controller.dart';
import 'package:fyp/view/all_restaurant/all_restaurant.dart';
import 'package:fyp/view/gems/gems_history.dart';
import 'package:fyp/view/restaurant_details/restaurant_details.dart';
import 'package:fyp/view/restaurant_list.dart/restaurant_list.dart';
import 'package:fyp/view/search_result/search_result.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/animation/gf_animation.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:getwidget/shape/gf_avatar_shape.dart';
import 'package:outline_search_bar/outline_search_bar.dart';
import 'package:fyp/view/global/global.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _ratingStar = 0;
  @override
  Widget build(BuildContext context) {
    var rt = Get.find<RestaurantController>();
    var rsfcl = Get.find<RestaurantFoodCategoryListController>();
    var gp = Get.find<GemsPointsController>();
    var ud = Get.find<UserDetailController>();
    var sr = Get.find<SearchRestaurantController>();
    var avgr = Get.find<StandardRatingController>();
    var gh = Get.find<GemsHistoryController>();
    var rd = Get.find<ResDetailController>();
    var rcat = Get.find<RestaurantCategoryController>();
    var rc = Get.find<RestaurantListController>();

    // print(gp.getGemsPoints());

    print('gem points');
    // print(vr);
    print("yo list ho restaurant ko");
    print(rt.restaurantList);
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          // elevation: 0,
          actions: [
            TextButton.icon(
                // <-- TextButton
                onPressed: () {
                  // gp.getGemsPoints();
                  gh.getGemsHistory();
                  Get.to(() => const GemsHistoryPage());
                },
                //Icon(FontAwesomeIcons.ticketAlt)
                icon: const Icon(
                  FontAwesomeIcons.gem,
                  color: Color.fromRGBO(37, 126, 2, 1),
                  size: 20.0,
                ),
                label: BAPTText(
                  // text: gp.gemsPoints.value.points.toString(),
                  text: gp.gemsPoints.value.points.toString(),
                  // text: globals.gemPoints.toString(),
                  // text: "sdkl",
                  color: Color.fromRGBO(37, 126, 2, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
          ],
          backgroundColor: Color.fromRGBO(8, 0, 49, 1),
          title: const Text("Bon Appetit"),
          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          //   icon: Icon(Icons.close),
          // ),
        ),
        body: Obx(
          () => rt.processing.value
              ? const Center(child: CircularProgressIndicator())
              : rt.restaurantList.value.data.isEmpty
                  ? const Center(
                      child: Text("no restaurants"),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: GFCarousel(
                              pagerSize: 6,
                              hasPagination: true,
                              passiveIndicator: Colors.black,
                              activeDotBorder: Border.all(color: Colors.white),
                              height: 130,
                              autoPlayInterval: Duration(seconds: 1),
                              autoPlay: false,
                              items: rt.restaurantList.value.data.map(
                                (e) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppSetting.secondaryColor,
                                            width: 2)),
                                    // margin: EdgeInsets.all(2.0),
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            SizedBox(
                                              height: 126,
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(2.0)),
                                                child: Image.network(e.image!,
                                                    fit: BoxFit.cover,
                                                    width: 1000.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                            bottom: 18,
                                            // right: MediaQuery.of(context).size.width * .30,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 40),
                                              child: Container(
                                                  // width: 960,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .60,
                                                  color: const Color.fromRGBO(
                                                      255, 255, 255, 0.3),
                                                  child: Center(
                                                      child: BAPTText(
                                                    text: e.name!,
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                  ))),
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              ).toList(),
                              onPageChanged: (index) {
                                setState(() {
                                  index;
                                });
                              },
                            ),
                          ),

                          // Container(
                          //   color: AppSetting.primaryColor,
                          //   child: Row(
                          //     children: [
                          //       Expanded(
                          //         flex: 4,
                          //         child: Padding(
                          //           padding: const EdgeInsets.all(10.0),
                          //           child: OutlineSearchBar(
                          //             borderRadius: const BorderRadius.all(
                          //                 Radius.circular(10)),
                          //             elevation: 0,
                          //             // keyboardType: TextInputType.text,
                          //             // backgroundColor: Colors.red,
                          //             hintText: "Search restaurants ",
                          //             borderColor: AppSetting.primaryColor,
                          //             borderWidth: 2,
                          //             searchButtonIconColor:
                          //                 AppSetting.primaryColor,
                          //             clearButtonColor:
                          //                 AppSetting.secondaryColor,
                          //             // onTap: ,
                          //             onSearchButtonPressed: (value) {
                          //               print(value);
                          //               if ((value).isEmpty) {
                          //                 errorSnackbar(
                          //                     "Please insert search word!");
                          //               } else {
                          //                 sr.getSearchedRes(value);
                          //                 Get.to(() => const SearchResult());
                          //               }
                          //             },
                          //           ),
                          //         ),
                          //       ),
                          //       // Expanded(child: Text('Sort By:')),
                          //       // Expanded(
                          //       //   flex: 2,
                          //       //   child: DropdownButton<String>(
                          //       //     // value: category,
                          //       //     isExpanded: true,
                          //       //     items: category.map((value) {
                          //       //       return DropdownMenuItem(
                          //       //         value: value,
                          //       //         child: Text(value),
                          //       //       );
                          //       //     }).toList(),
                          //       //     onChanged: (value) {
                          //       //       // incomeCategory = value;
                          //       //       // print(value);
                          //       //       // setState(() {});
                          //       //     },
                          //       //     hint: Text("Rating"),
                          //       //     style: TextStyle(color: Colors.black),
                          //       //   ),
                          //       // ),
                          //     ],
                          //   ),
                          // ),

                          // Padding(
                          //   padding: const EdgeInsets.all(10.0),
                          //   child: OutlineSearchBar(
                          //     borderRadius:
                          //         const BorderRadius.all(Radius.circular(0)),
                          //     elevation: 0,
                          //     // keyboardType: TextInputType.text,
                          //     // backgroundColor: Colors.red,
                          //     hintText: "Search restaurants . . . . . . . . ",
                          //     borderColor: AppSetting.primaryColor,
                          //     borderWidth: 2,
                          //     searchButtonIconColor: AppSetting.primaryColor,
                          //     clearButtonColor: AppSetting.secondaryColor,
                          //     // onTap: ,
                          //     onSearchButtonPressed: (value) {
                          //       print(value);
                          //       sr.getSearchedRes(value);
                          //       Get.to(() => const SearchResult());
                          //     },
                          //   ),
                          // ),

                          Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Container(
                              height: 110,
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width,
                              // color: Colors.white,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: rcat
                                      .restaurantCategoryList.value.data.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var mydata = rcat.restaurantCategoryList
                                        .value.data[index];
                                    return InkWell(
                                      // onTap: () {

                                      //   // plc.getProductListCategory(
                                      //   //     cat.categoryList.value.data[index].id);
                                      //   fcfl.getFoodCategoryFoodList(mydata.id!);
                                      //   globals.category_id = mydata.id!;
                                      //   Get.to(() => const FoodCategoryFoodListPage());
                                      // },

                                      onTap: () {
                                        // rc.getRestaurantList(rcat
                                        //     .restaurantCategoryList
                                        //     .value
                                        //     .data[index]
                                        //     .id!);
                                        // Get.to(
                                        //     () => const RestaurantListPage());
                                        rc.getRestaurantList(rcat
                                            .restaurantCategoryList
                                            .value
                                            .data[index]
                                            .id!);
                                        Get.to(
                                            () => const RestaurantListPage());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Column(
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: AppSetting
                                                        .secondaryColor,
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40)),
                                              child: GFAvatar(
                                                  maxRadius: 34,
                                                  // size: GFSize.LARGE,
                                                  backgroundImage: NetworkImage(
                                                      mydata.image.toString()),
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

                          Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: BAPTText(
                              text: "Restaurants",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: rt.restaurantList.value.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var mydata =
                                      rt.restaurantList.value.data[index];
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

                                  return Stack(children: [
                                    Card(
                                      child: Container(
                                        child: InkWell(
                                          onTap: () {
                                            // Navigator.pushNamed(
                                            //     context, 'restaurantDetails');

                                            rsfcl.getRestaurantFoodCategoryList(
                                                mydata.userId!);
                                            avgr.getStandardRating(
                                                mydata.userId!);
                                            rd.getResDetail(mydata.userId!);
                                            // print("user_id");
                                            // print(mydata.userId);
                                            // print("id");
                                            // print(mydata.id);
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
                                              Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 140,
                                                  child: Image.network(
                                                      mydata.image!,
                                                      fit: BoxFit.cover)),
                                              ListTile(
                                                // title: Text(rstl
                                                //     .restaurants.value.data[index].name
                                                //     .toString()),
                                                title: BAPTText(
                                                    text:
                                                        mydata.name.toString(),
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                subtitle: BAPTText(
                                                  text:
                                                      mydata.address.toString(),
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                // trailing: Icon(Icons.restaurant,
                                                //     color: Colors.black),
                                              ),
                                              // Padding(
                                              //   padding: const EdgeInsets.only(
                                              //       left: 10),
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
                                              //     itemPadding: const EdgeInsets
                                              //             .symmetric(
                                              //         horizontal: 2.0),
                                              //     itemBuilder: (context, _) =>
                                              //         const Icon(
                                              //       Icons.star,
                                              //       color: Colors.amber,
                                              //     ),
                                              //     onRatingUpdate: (rating) {
                                              //       print(rating);
                                              //       _ratingStar = rating;
                                              //       print(_ratingStar);
                                              //     },
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 110,
                                      right: 20,
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: const BoxDecoration(
                                          color: AppSetting.ancentColor,
                                          shape: BoxShape.circle,
                                          boxShadow: const [
                                            // color: Colors.white, //background color of box
                                            BoxShadow(
                                              color: Colors.black,
                                              blurRadius:
                                                  6.0, // soften the shadow
                                              spreadRadius:
                                                  0, //extend the shadow
                                              offset: Offset(
                                                0, // Move to right 10  horizontally
                                                0, // Move to bottom 10 Vertically
                                              ),
                                            )
                                          ],
                                        ),
                                        child: const Icon(Icons.restaurant),
                                      ),
                                    ),
                                  ]);
                                },
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 40, left: 240),
                            child: ElevatedButton.icon(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppSetting.primaryColor),
                                ),
                                onPressed: () {
                                  Get.to(() => const AllProducts());
                                },
                                icon: Icon(
                                  Icons.more_vert_rounded,
                                ),
                                label: BAPTText(
                                  text: "View All",
                                  color: Colors.white,
                                )
                                // Divider(),
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Card(
                                //     child: Container(
                                //       child: InkWell(
                                //         onTap: () {
                                //           Navigator.pushNamed(context, 'restaurantDetails');
                                //         },
                                //         child: Column(
                                //           mainAxisAlignment: MainAxisAlignment.start,
                                //           crossAxisAlignment: CrossAxisAlignment.start,
                                //           children: [
                                //             Container(
                                //               child: Image.asset('images/product.jpg'),
                                //             ),
                                //             ListTile(
                                //               title: Text("Olive Cafe"),
                                //               subtitle: Text("Dharan, Putali line"),
                                //             ),
                                //             Padding(
                                //               padding: const EdgeInsets.only(left: 10),
                                //               child: RatingBar.builder(
                                //                 updateOnDrag: false,
                                //                 ignoreGestures: true,
                                //                 itemSize: 20,
                                //                 initialRating: 4,
                                //                 // initialRating: 4,
                                //                 minRating: 1,
                                //                 direction: Axis.horizontal,
                                //                 allowHalfRating: true,
                                //                 itemCount: 5,
                                //                 itemPadding:
                                //                     EdgeInsets.symmetric(horizontal: 2.0),
                                //                 itemBuilder: (context, _) => Icon(
                                //                   Icons.star,
                                //                   color: Colors.amber,
                                //                 ),
                                //                 onRatingUpdate: (rating) {
                                //                   print(rating);
                                //                 },
                                //               ),
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
