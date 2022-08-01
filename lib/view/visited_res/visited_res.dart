import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/components/error_snackbar.dart';
import 'package:fyp/components/info_snackbar.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/controller/food_category_food_list_controller.dart';
import 'package:fyp/controller/food_controller.dart';
import 'package:fyp/controller/rate_res_controller.dart';
import 'package:fyp/controller/restaurant_food_category_list_controller.dart';
import 'package:fyp/controller/visited_res_controller.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:fyp/view/food_list/food_list.dart';
import 'package:fyp/view/rate%20restaurant/rate_restaurant.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

class VisitedRestaurantPage extends StatelessWidget {
  const VisitedRestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vr = Get.find<VisitedResController>();
    var rr = Get.find<RateResController>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(8, 0, 49, 1),
          title: const Text("Visited Restaurants"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, 'dashboard');
            },
            icon: Icon(Icons.close),
          ),
        ),
        body: Obx(
          () => vr.processing.value
              ? const Center(child: CupertinoActivityIndicator())
              : vr.visitedRes.value.data.isEmpty
                  ? const Center(
                      child: Text("No Visited Restaunrant"),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
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

                          //food categories
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: vr.visitedRes.value.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                var mydata = vr.visitedRes.value.data[index];
                                rr.getRateRes(
                                    vr.visitedRes.value.data[index].resUserId!);

                                return Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: InkWell(
                                      onTap: () {
                                        rr.getRateRes(vr.visitedRes.value
                                            .data[index].resUserId!);
                                        Get.off(() => RateRestaurantPage());
                                      },
                                      child: Center(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 20),
                                          child: ClipOval(
                                            child: SizedBox(
                                              width: 100,
                                              height: 100,
                                              child: ElevatedButton(
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .resolveWith(
                                                                (states) {
                                                      // If the button is pressed, return green, otherwise blue
                                                      if (states.contains(
                                                          MaterialState
                                                              .pressed)) {
                                                        return AppSetting
                                                            .primaryColor;
                                                      }
                                                      return AppSetting
                                                          .primaryColor;
                                                    }),
                                                    textStyle:
                                                        MaterialStateProperty
                                                            .resolveWith(
                                                                (states) {
                                                      if (states.contains(
                                                          MaterialState
                                                              .pressed)) {
                                                        return TextStyle(
                                                            fontSize: 60);
                                                      }
                                                      return TextStyle(
                                                          fontSize: 20);
                                                    }),
                                                  ),
                                                  onPressed: () {
                                                    rr.getRateRes(vr
                                                        .visitedRes
                                                        .value
                                                        .data[index]
                                                        .resUserId!);

                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (BuildContext
                                                                    context) =>
                                                                Column(
                                                                  children: [
                                                                    Text(rr
                                                                        .rateRes
                                                                        .value
                                                                        .data[
                                                                            index]
                                                                        .name),
                                                                    RatingDialog(
                                                                        commentHint:
                                                                            "",
                                                                        enableComment:
                                                                            true,
                                                                        showCloseButton:
                                                                            true,
                                                                        starSize:
                                                                            20,
                                                                        title:
                                                                            Text(
                                                                          rr.rateRes.value.data[index].name.toUpperCase() +
                                                                              "\n" +
                                                                              " \n"
                                                                                  "Your rating and review are highly appreciated.",
                                                                          style:
                                                                              TextStyle(fontSize: 14),
                                                                        ),
                                                                        submitButtonText:
                                                                            "Submit",
                                                                        onSubmitted:
                                                                            (response) async {
                                                                         
                                                                          Map data =
                                                                              {
                                                                            "value":
                                                                                response.rating,
                                                                            "review":
                                                                                response.comment,
                                                                            "restaurant_id":
                                                                                vr.visitedRes.value.data[index].resUserId!,
                                                                          };
                                                                          print(
                                                                              data);

                                                                          await RemoteService.postData(
                                                                              'ratings',
                                                                              data);
                                                                        }),
                                                                  ],
                                                                ));
                                                  },
                                                  child:
                                                      // BAPTText(
                                                      //   text: "Rating/Review",
                                                      //   color: Colors.white,
                                                      // ),
                                                      Row(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      const Expanded(
                                                          child: Icon(Icons
                                                              .feedback_outlined)),
                                                      const  Expanded(
                                                        child: Icon(
                                                          Icons.star,
                                                          size: 30,
                                                          color: Colors.amber,
                                                        ),
                                                      ),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        ),
                                      )),
                                );
                              }),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
