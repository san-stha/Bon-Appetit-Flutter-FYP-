import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/components/my_drawer.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/const/controllers.dart';
import 'package:fyp/controller/food_controller.dart';
import 'package:fyp/controller/rate_res_controller.dart';
import 'package:fyp/controller/restaurantController.dart';
import 'package:fyp/controller/restaurant_food_category_list_controller.dart';
import 'package:fyp/controller/restaurant_list_controller.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:fyp/view/restaurant_details/restaurant_details.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
import 'package:rating_dialog/rating_dialog.dart';

class RateRestaurantPage extends StatefulWidget {
  const RateRestaurantPage({Key? key}) : super(key: key);

  @override
  State<RateRestaurantPage> createState() => _RateRestaurantPageState();
}

class _RateRestaurantPageState extends State<RateRestaurantPage> {
  double _ratingStar = 0;

  @override
  Widget build(BuildContext context) {
    // var rstl = Get.find<RestaurantListController>();
    // var rsfcl = Get.find<RestaurantFoodCategoryListController>();
    var rr = Get.find<RateResController>();
    print(rr.rateRes.value.data);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(8, 0, 49, 1),
          title: const Text("Rate"),
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
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: rr.rateRes.value.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var mydata = rr.rateRes.value.data[index];
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Card(
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 140,
                                    child: Image.network(mydata.image,
                                        fit: BoxFit.cover)),
                              ),
                              Card(
                                child: ListTile(
                                  // title: Text(rstl
                                  //     .restaurants.value.data[index].name
                                  //     .toString()),
                                  title: BAPTText(
                                      text: mydata.name.toString(),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  subtitle: BAPTText(
                                    text:
                                        mydata.restaurantCategoryId.toString(),
                                    fontWeight: FontWeight.w300,
                                  ),
                                  // trailing: Icon(Icons.restaurant,
                                  //     color: Colors.black),
                                ),
                              ),

                              // SmoothStarRating(
                              //     allowHalfRating: true,
                              //     onRatingChanged: (value) {
                              //       _ratingStar = value;
                              //       print(_ratingStar);
                              //       setState(() {});
                              //     },
                              //     starCount: 5,
                              //     rating: _ratingStar,
                              //     size: 30.0,
                              //     filledIconData: Icons.star_rounded,
                              //     halfFilledIconData: Icons.star_half_rounded,
                              //     color: Colors.amber,
                              //     borderColor: Colors.amber,
                              //     spacing: 0.0),

                              // Padding(
                              //   padding: const EdgeInsets.all(4.0),
                              //   child: TextFormField(
                              //     controller: review,
                              //     decoration: InputDecoration(
                              //         focusColor: AppSetting.ancentColor,
                              //         prefixIcon: Icon(Icons.person),
                              //         labelText: "First Name",
                              //         enabledBorder: OutlineInputBorder(
                              //             borderSide: BorderSide(
                              //                 width: 2,
                              //                 color:
                              //                     AppSetting.secondaryColor)),
                              //         focusedBorder: OutlineInputBorder(
                              //           borderSide: BorderSide(
                              //               width: 3, color: Colors.black),
                              //           // borderRadius: BorderRadius.circular(15),
                              //         ),
                              //         errorBorder: OutlineInputBorder(
                              //             borderSide: BorderSide(
                              //                 color: Colors.red, width: 3))),
                              //     validator: (value) =>
                              //         value!.isEmpty ? 'required' : null,
                              //     keyboardType: TextInputType.text,
                              //   ),
                              // ),

                              Padding(
                                padding: const EdgeInsets.all(40.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * .80,
                                  child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          // If the button is pressed, return green, otherwise blue
                                          if (states
                                              .contains(MaterialState.pressed)) {
                                            return AppSetting.primaryColor;
                                          }
                                          return AppSetting.primaryColor;
                                        }),
                                        textStyle:
                                            MaterialStateProperty.resolveWith(
                                                (states) {
                                          // If the button is pressed, return size 40, otherwise 20
                                          if (states
                                              .contains(MaterialState.pressed)) {
                                            return TextStyle(fontSize: 60);
                                          }
                                          return TextStyle(fontSize: 20);
                                        }),
                                      ),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                RatingDialog(
                                                    commentHint:
                                                        "",
                                                    enableComment: true,
                                                    showCloseButton: true,
                                                    starSize: 20,
                                                    title: const Text("Your rating and review are highly appreciated.", style: TextStyle(fontSize: 14),  ),
                                                    submitButtonText: "Submit",
                                                    onSubmitted: (response) async {
                                                      Map data = {
                                                        "value": response.rating,
                                                        "review": response.comment,
                                                        "restaurant_id":
                                                            mydata.userId,
                                                      };
                                                      print(data);

                                                      await RemoteService.postData(
                                                          'ratings', data);
                                                    }));
                                      },
                                      child: BAPTText(text: "Click to rate and comment", color: Colors.white,)),
                                ),
                              ),

                              // Center(
                              //   child: Padding(
                              //     padding: const EdgeInsets.all(10.0),
                              //     child: MaterialButton(
                              //       minWidth: 140,
                              //       color: AppSetting.primaryColor,
                              //       onPressed: () async {
                              //         Map data = {
                              //           "value": _ratingStar,
                              //           "review": review.text,
                              //           "restaurant_id": mydata.userId,
                              //         };

                              //         print(data);
                              //         // var response =
                              //         //     await RemoteService.postData(data, 'cart');

                              //         await RemoteService.postData(
                              //             'ratings', data);

                              //         review.clear();
                              //       },
                              //       child: const BAPTText(
                              //         text: "Submit",
                              //         color: Colors.white,
                              //         // fontWeight: FontWeight.bold,
                              //         fontSize: 18,
                              //       ),
                              //     ),
                              //   ),
                              // ),

                              // FloatingActionButton.extended(
                              //   label: BAPTText(
                              //     text: "Rate",
                              //   ),
                              //   icon: Icon(Icons.star),
                              //   backgroundColor: Colors.amber,
                              //   onPressed: () {
                              //     showDialog(
                              //         context: context,
                              //         builder: (BuildContext context) =>
                              //             AlertDialog(
                              //               // title: const Text('Warning'),
                              //               content: SmoothStarRating(
                              //                   allowHalfRating: true,
                              //                   onRatingChanged: (value) {
                              //                     _ratingStar = value;
                              //                     print(_ratingStar);
                              //                     setState(() {});
                              //                   },
                              //                   starCount: 5,
                              //                   rating: _ratingStar,
                              //                   size: 30.0,
                              //                   filledIconData:
                              //                       Icons.star_rounded,
                              //                   halfFilledIconData:
                              //                       Icons.star_half_rounded,
                              //                   color: Colors.amber,
                              //                   borderColor: Colors.amber,
                              //                   spacing: 0.0),

                              //               actions: <Widget>[
                              //                 TextFormField(
                              //                   controller: review,
                              //                   decoration:
                              //                       const InputDecoration(
                              //                           labelText:
                              //                               'Your review ',
                              //                           prefixIcon:
                              //                               Icon(Icons.edit),
                              //                           enabledBorder:
                              //                               OutlineInputBorder(
                              //                                   borderSide: BorderSide(
                              //                                       width: 2,
                              //                                       color: Colors
                              //                                           .grey)),
                              //                           focusedBorder:
                              //                               OutlineInputBorder(
                              //                             borderSide:
                              //                                 BorderSide(
                              //                                     width: 3,
                              //                                     color: Colors
                              //                                         .black),
                              //                             // borderRadius: BorderRadius.circular(15),
                              //                           ),
                              //                           errorBorder:
                              //                               OutlineInputBorder(
                              //                                   borderSide:
                              //                                       BorderSide(
                              //                                           color: Colors
                              //                                               .red,
                              //                                           width:
                              //                                               3))),
                              //                   validator: (value) =>
                              //                       value!.isEmpty
                              //                           ? 'required'
                              //                           : null,
                              //                   keyboardType:
                              //                       TextInputType.emailAddress,
                              //                 ),
                              //                 Center(
                              //                   child: Padding(
                              //                     padding: const EdgeInsets.all(
                              //                         10.0),
                              //                     child: MaterialButton(
                              //                       minWidth: 140,
                              //                       color:
                              //                           AppSetting.primaryColor,
                              //                       onPressed: () async {
                              //                         Map data = {
                              //                           "value": _ratingStar,
                              //                           "review": review,
                              //                           "restaurant_id":
                              //                               mydata.userId,
                              //                         };

                              //                         print(data);
                              //                         // var response =
                              //                         //     await RemoteService.postData(data, 'cart');

                              //                         await RemoteService
                              //                             .postData(
                              //                                 'ratings', data);
                              //                       },
                              //                       child: const BAPTText(
                              //                         text: "Submit",
                              //                         color: Colors.white,
                              //                         // fontWeight: FontWeight.bold,
                              //                         fontSize: 18,
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ),
                              //               ],
                              //             ));
                              //   },
                              // )

                              // FloatingActionButton.extended(
                              //   label: BAPTText(
                              //     text: "Rate",
                              //   ),
                              //   icon: Icon(Icons.star,),
                              //   backgroundColor: Colors.amber,
                              //   onPressed: () {
                              //     showDialog(
                              //         context: context,
                              //         builder: (BuildContext context) =>
                              //             RatingDialog(
                              //               commentHint: "Comment on your experience",
                              //               enableComment: true,
                              //               showCloseButton: true,
                              //               starSize: 30,
                              //                 title: Text(mydata.name),
                              //                 submitButtonText: "Submit",
                              //                 onSubmitted: (response) async {
                              //                   Map data = {
                              //                     "value": response.rating,
                              //                     "review": response.comment,
                              //                     "restaurant_id":
                              //                         mydata.userId,
                              //                   };
                              //                   print(data);

                              //                   await RemoteService.postData(
                              //                       'ratings', data);
                              //                 }));
                              //   },
                              // )
                            ],
                          ),
                          SizedBox(),
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
                                    blurRadius: 6.0, // soften the shadow
                                    spreadRadius: 0, //extend the shadow
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
