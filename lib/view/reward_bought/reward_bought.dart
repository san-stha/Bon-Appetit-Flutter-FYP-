import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/controller/reward_bought_controller.dart';
import 'package:get/state_manager.dart';
import 'package:get/get.dart';

class RewardBought extends StatefulWidget {
  const RewardBought({Key? key}) : super(key: key);

  @override
  State<RewardBought> createState() => _RewardBoughtState();
}

class _RewardBoughtState extends State<RewardBought> {
  @override
  Widget build(BuildContext context) {
    var rb = Get.find<RewardBoughtController>();
    var rewardIcon;
    var statusColor;
    return Scaffold(
      appBar: AppBar(
        title: Text("Reward Purchase"),
        centerTitle: true,
        backgroundColor: AppSetting.primaryColor,
      ),
      body: Obx(() => rb.processing.value
          ? const Center(child: CupertinoActivityIndicator())
          : rb.rewardBought.value.data.isEmpty
              ? const Center(
                  child: Text("No Rewards Bought"),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          shrinkWrap: true,
                          itemCount: rb.rewardBought.value.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var mydata = rb.rewardBought.value.data[index];
                            if (mydata.status == "redeemed") {
                              rewardIcon = const Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.green,
                                  size: 24);
                              statusColor = Colors.green;
                            } else if (mydata.status == "redeemable") {
                              rewardIcon = const Icon(Icons.redeem_rounded,
                                  color: Colors.amber, size: 24);
                              statusColor = Colors.amber;
                            }
                            return Stack(children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  right: 10,
                                ),
                                child: Container(
                                  height: 250,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    // color: Colors.red,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 120,
                                        width: double.infinity,
                                        child: const ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4)),
                                            child:
                                                //  Image.network(
                                                //   mydata.image,
                                                //   fit: BoxFit.cover,
                                                //   height: 120,
                                                //   width: double.infinity,
                                                // ),

                                                Image(
                                              image: NetworkImage(
                                                  "https://images.pexels.com/photos/291528/pexels-photo-291528.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                                              fit: BoxFit.cover,
                                            )),
                                      ),

                                      // BAPTText(text: mydata.name),
                                      // BAPTText(text: mydata.price.toString()),
                                      SizedBox(
                                        height: 30,
                                        child: ListTile(
                                          title: BAPTText(
                                            text: mydata.name!,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          subtitle: BAPTText(
                                              text: mydata.cost!
                                                      .toInt()
                                                      .toString() +
                                                  " Gems"),
                                          trailing: rewardIcon,
                                        ),
                                      )

                                      // SizedBox(
                                      //   height: 100,
                                      //   child: ListTile(
                                      //     // title: Text(rstl
                                      //     //     .restaurants.value.data[index].name
                                      //     //     .toString()),
                                      //     title: BAPTText(
                                      //         text: mydata.name
                                      //             .toString(),
                                      //         fontSize: 18,
                                      //         fontWeight: FontWeight.bold),
                                      //     subtitle: BAPTText(
                                      //       text: mydata.price
                                      //           .toString(),
                                      //       fontWeight: FontWeight.w300,
                                      //     ),
                                      //     // trailing: Icon(Icons.restaurant,
                                      //     //     color: Colors.black),
                                      //   ),
                                      // ),
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
                              Positioned(
                                  top: 90,
                                  left: 88,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      color: statusColor,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          BAPTText(
                                              text: mydata.status!,
                                              color: Colors.white,
                                              fontSize: 12),
                                          BAPTText(
                                              text:
                                                  "( " + mydata.finder! + " )",
                                              color: Colors.white,
                                              fontSize: 12)
                                        ],
                                      ),
                                    ),
                                  ))
                            ]);
                          },
                        ),
                      )
                    ],
                  ),
                )),
    );
  }
}
