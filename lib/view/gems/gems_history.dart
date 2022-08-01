import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:fyp/controller/coupon_controller.dart';
import 'package:fyp/controller/gems_history_controller.dart';
import 'package:fyp/controller/restaurantController.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';
// import 'package:ticketview/ticketview.dart';
// import 'package:google_fonts/google_fonts.dart';

class GemsHistoryPage extends StatefulWidget {
  const GemsHistoryPage({Key? key}) : super(key: key);

  @override
  _GemsHistoryPageState createState() => _GemsHistoryPageState();
}

class _GemsHistoryPageState extends State<GemsHistoryPage> {
  double _ratingStar = 0;
  @override
  Widget build(BuildContext context) {
    var ghc = Get.find<GemsHistoryController>();
    Color? gemColor = Colors.purple;
    print(ghc.gemsHistory.value.data);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppSetting.primaryColor,
        title: const Text("Gems"),
        centerTitle: true,
      ),
      body: Obx(
        () => ghc.processing.value
            ? const Center(child: CupertinoActivityIndicator(
              animating: false
            ))
            : ghc.gemsHistory.value.data.isEmpty
                ? const Center(
                    child: Text("No Gems History"),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          shrinkWrap: true,
                          itemCount: ghc.gemsHistory.value.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            var mydata = ghc.gemsHistory.value.data[index];
                            if (mydata.points < 0) {
                              gemColor = Colors.red;
                            } else if (mydata.points > 0) {
                              gemColor = Colors.green[900];
                            }
                            return Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Container(
                                // color: Colors.grey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(
                                        FontAwesomeIcons.gem,
                                        color: gemColor,
                                        size: 40,
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: BAPTText(
                                          text: mydata.points.toString(),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: BAPTText(
                                          text: mydata.createdAt.toString(),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              // Container(
                              //   height: 100,
                              //   decoration: const BoxDecoration(
                              //     borderRadius: BorderRadius.all(Radius.circular(10)),
                              //     color: Colors.white,
                              //   ),
                              //   child: Column(
                              //     mainAxisAlignment: MainAxisAlignment.start,
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       ClipRRect(
                              //           borderRadius:
                              //               BorderRadius.all(Radius.circular(4)),
                              //           child: Icon(FontAwesomeIcons.solidGem)),
                              //       SizedBox(
                              //         height: 10,
                              //         child: ListTile(
                              //           title: BAPTText(
                              //             text: mydata.points.toString(),
                              //             fontWeight: FontWeight.bold,
                              //           ),
                              //           subtitle: BAPTText(
                              //               text: mydata.restaurantId.toString()),
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
