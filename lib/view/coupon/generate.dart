import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:fyp/controller/coupon_controller.dart';
import 'package:fyp/controller/restaurantController.dart';
import 'package:fyp/view/login/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ticketview/ticketview.dart';
// import 'package:google_fonts/google_fonts.dart';

class GenerateCoupon extends StatefulWidget {
  const GenerateCoupon({Key? key}) : super(key: key);

  @override
  _GenerateCouponState createState() => _GenerateCouponState();
}

class _GenerateCouponState extends State<GenerateCoupon> {
  void checkToken() async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
     var token = preferences.getString("token");
     if (token == null){
       Get.offAll(Login());
     }
   }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkToken();
  }

  @override
  Widget build(BuildContext context) {
    var cpn = Get.find<CouponController>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppSetting.primaryColor,
          title: const Text("Coupons"),
          centerTitle: true,
        ),
        body: Obx(
          () => cpn.processing.value
              ? const Center(child: CupertinoActivityIndicator())
              : cpn.couponList.value.data.isEmpty
                  ? const Center(
                      child: Text("No Coupons Available"),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          // const Text("Generate new Coupon :"),
                          // ListTile(
                          //   onTap: () {},
                          //   title: const Text("Restaurant's Name"),
                          //   subtitle: const Text("Unused Coupon Status"),
                          //   trailing: const Text("status"),
                          // ),

                          // Text("data"),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 10),
                          //   child: Container(
                          //       decoration: BoxDecoration(
                          //         color: Colors.red,
                          //         image: DecorationImage(
                          //           image: AssetImage("images/mycoupon1.png"),
                          //           fit: BoxFit.cover,
                          //         ),
                          //       ),
                          //       height: 160,
                          //       width: width * .98,
                          //       child: Center(
                          //           child: ListTile(
                          //         title: BAPTText(
                          //           text: "text %",
                          //           color: Colors.white,
                          //           fontSize: 20,
                          //         ),
                          //       ))),
                          // ),

                          // ListView.builder(
                          //     itemCount: cpn.couponList.value.data.length,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return Padding(
                          //         padding: const EdgeInsets.symmetric(
                          //             horizontal: 10),
                          //         child: Container(
                          //             decoration: BoxDecoration(
                          //               color: Colors.red,
                          //               image: DecorationImage(
                          //                 image: AssetImage(
                          //                     "images/mycoupon1.png"),
                          //                 fit: BoxFit.cover,
                          //               ),
                          //             ),
                          //             height: 160,
                          //             width: width * .98,
                          //             child: Center(
                          //                 child: ListTile(
                          //               title: BAPTText(
                          //                 text: "text %",
                          //                 color: Colors.white,
                          //                 fontSize: 20,
                          //               ),
                          //             ))),
                          //       );
                          //     }),

                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: cpn.couponList.value.data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var mydata = cpn.couponList.value.data[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Container(
                                        decoration: const BoxDecoration(
                                          color: Colors.red,
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "images/mycoupon2.png"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        height: 160,
                                        width: width * .98,
                                        child: Center(
                                            child: ListTile(
                                          leading: BAPTText(
                                            text:
                                                mydata.percentOff!.toString() +
                                                    " %",
                                            color: Colors.white,
                                            fontSize: 18,
                                          ),
                                          title: BAPTText(
                                            text: mydata.code!.toString(),
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        ))),
                                  );
                                  // return Padding(
                                  //   padding: const EdgeInsets.all(10.0),
                                  //   child: Ticket(
                                  //     radius: 20,
                                  //     child: GestureDetector(
                                  //       onTap: () => Navigator.pushNamed(
                                  //           context, '/ticket_demo'),
                                  //       child: Container(
                                  //         // decoration: BoxDecoration(
                                  //         //     color: Colors.white,
                                  //         //     border: Border.all(style: BorderStyle.solid)),
                                  //         color: AppSetting.couponColor,
                                  //         width: MediaQuery.of(context)
                                  //                 .size
                                  //                 .width *
                                  //             1,
                                  //         height: MediaQuery.of(context)
                                  //                 .size
                                  //                 .height *
                                  //             .41,
                                  //         // child: const Center(child: Text('Generate')),
                                  //         child: Column(children: [
                                  //           // SizedBox(
                                  //           //   height: 10,
                                  //           // ),
                                  //           Container(
                                  //             width: MediaQuery.of(context)
                                  //                 .size
                                  //                 .width,
                                  //             height: MediaQuery.of(context)
                                  //                     .size
                                  //                     .height *
                                  //                 .10,
                                  //             color: AppSetting.secondaryColor,
                                  //             child: Center(
                                  //               child: BAPTText(
                                  //                 color: AppSetting.ancentColor,
                                  //                 text: cpn.couponList.value
                                  //                     .data[index].code
                                  //                     .toString(),
                                  //                 fontSize: 14,
                                  //                 fontWeight: FontWeight.bold,
                                  //               ),
                                  //             ),
                                  //           ),
                                  //           // DottedLine(),
                                  //           // const Divider(
                                  //           //   height: 10,
                                  //           //   thickness: 4,
                                  //           // ),
                                  //           //  ListTile(
                                  //           //    onTap: (){},
                                  //           //    title: Text("ds"),
                                  //           //    subtitle: Text("12"),
                                  //           //    leading: Text("oo"),
                                  //           //  )

                                  //           Container(
                                  //             height: MediaQuery.of(context)
                                  //                     .size
                                  //                     .height *
                                  //                 .20,
                                  //             child: Row(
                                  //               children: [
                                  //                 Expanded(
                                  //                     flex: 2,
                                  //                     child: Padding(
                                  //                       padding:
                                  //                           const EdgeInsets
                                  //                               .all(10.0),
                                  //                       child: Container(
                                  //                         child: Image.asset(
                                  //                           "images/logo.png",
                                  //                           width: width,
                                  //                           height: height,
                                  //                           fit: BoxFit.contain,
                                  //                         ),
                                  //                       ),
                                  //                     )),
                                  //                 // VerticalDivider(
                                  //                 //   width: 10,
                                  //                 //   thickness: 4,
                                  //                 //   color: Colors.black,
                                  //                 // ),
                                  //                 DottedLine(
                                  //                     direction: Axis.vertical,
                                  //                     lineLength: height * .15,
                                  //                     lineThickness: 2,
                                  //                     dashColor: AppSetting
                                  //                         .secondaryColor),

                                  //                 Expanded(
                                  //                   flex: 5,
                                  //                   child: Column(
                                  //                     children: [
                                  //                       // Row(
                                  //                       //   children: [
                                  //                       //     const Expanded(
                                  //                       //       flex: 2,
                                  //                       //       child: BAPTText(
                                  //                       //         text: "SAVE:",
                                  //                       //         fontSize: 40,
                                  //                       //         fontWeight: FontWeight.bold,
                                  //                       //       ),
                                  //                       //     ),
                                  //                       //     Expanded(
                                  //                       //       flex: 3,
                                  //                       //       child: BAPTText(
                                  //                       //         text: cpn.couponList[index]
                                  //                       //                 .percentOff
                                  //                       //                 .toString() +
                                  //                       //             " % ",
                                  //                       //         fontSize: 40,
                                  //                       //         fontWeight: FontWeight.bold,
                                  //                       //       ),
                                  //                       //     )
                                  //                       //   ],
                                  //                       // ),
                                  //                       Center(
                                  //                         child: BAPTText(
                                  //                           text: cpn
                                  //                                   .couponList
                                  //                                   .value
                                  //                                   .data[index]
                                  //                                   .percentOff
                                  //                                   .toString() +
                                  //                               " % " +
                                  //                               " Off ",
                                  //                           fontSize: 36,
                                  //                           fontWeight:
                                  //                               FontWeight.bold,
                                  //                           color: Colors.black,
                                  //                         ),
                                  //                       ),
                                  //                       Padding(
                                  //                         padding:
                                  //                             const EdgeInsets
                                  //                                 .only(
                                  //                           top: 30,
                                  //                         ),
                                  //                         child: Center(
                                  //                           child: BAPTText(
                                  //                             text: " Enjoy " +
                                  //                                 cpn
                                  //                                     .couponList
                                  //                                     .value
                                  //                                     .data[
                                  //                                         index]
                                  //                                     .percentOff
                                  //                                     .toString() +
                                  //                                 "% off on your next order.",
                                  //                             fontSize: 10,
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .bold,
                                  //                           ),
                                  //                         ),
                                  //                       )
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           ),
                                  //           // const Divider(
                                  //           //   height: 10,
                                  //           //   thickness: 4,
                                  //           // ),
                                  //           // DottedLine(),
                                  //           InkWell(
                                  //             child: Container(
                                  //               width: MediaQuery.of(context)
                                  //                   .size
                                  //                   .width,
                                  //               height: MediaQuery.of(context)
                                  //                       .size
                                  //                       .height *
                                  //                   .11,
                                  //               color:
                                  //                   AppSetting.secondaryColor,
                                  //               child: Center(
                                  //                   child: Text(
                                  //                 "Details",
                                  //                 style: TextStyle(
                                  //                   color: Colors.white,
                                  //                 ),
                                  //               )),
                                  //             ),
                                  //           )
                                  //         ]),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // );
                                }),
                          )

                          // TicketView(
                          //     backgroundPadding:
                          //         EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                          //     backgroundColor: Color(0xFF8F1299),
                          //     contentPadding:
                          //         EdgeInsets.symmetric(vertical: 24, horizontal: 0),
                          //     drawArc: false,
                          //     triangleAxis: Axis.vertical,
                          //     borderRadius: 6,
                          //     drawDivider: true,
                          //     trianglePos: .5,
                          //     child: Container(
                          //       child: Column(
                          //         mainAxisSize: MainAxisSize.max,
                          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //         children: <Widget>[
                          //           Text(
                          //             'PROMO TICKET',
                          //             // style: GoogleFonts.poppins(
                          //             //     color: Colors.black, fontSize: 16),
                          //           ),
                          //           Text(
                          //             '\$10.00',
                          //             // style: GoogleFonts.poppins(
                          //             //     color: Colors.red,
                          //             //     fontSize: 20,
                          //             //     fontWeight: FontWeight.w700),
                          //           ),
                          //           Text(
                          //             '120 Tickets Available',
                          //             // style: GoogleFonts.poppins(
                          //             //     color: Colors.black, fontSize: 12),
                          //           )
                          //         ],
                          //       ),
                          //     ))
                        ],
                      ),
                    ),
        ));
  }
}
