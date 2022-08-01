import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/api/api.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/components/error_snackbar.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/const/text.dart';
import 'package:fyp/controller/rate_res_controller.dart';
import 'package:fyp/controller/reward_bought_controller.dart';
import 'package:fyp/controller/user_detail_model.dart';
import 'package:fyp/controller/visited_res_controller.dart';
import 'package:fyp/view/all_restaurant/all_restaurant.dart';
import 'package:fyp/view/login/login.dart';
import 'package:fyp/view/reward_bought/reward_bought.dart';
import 'package:fyp/view/user_profile/user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyp/view/visited_res/visited_res.dart';
import 'package:get/get.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    var vr = Get.find<VisitedResController>();
    // print(vr.visitedRes.value.data);
    var rb = Get.find<RewardBoughtController>();
    var ud = Get.find<UserDetailController>();

    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: AppSetting.primaryColor),
              accountName: Text('Bon Appetit'),
              accountEmail: Text(''),
              currentAccountPicture: CircleAvatar(
                backgroundColor: AppSetting.ancentText,
                child: Text(
                  'B',
                  style: TextStyle(color: AppSetting.primaryText),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: ListTile(
                  onTap: () {
                    vr.getVisitedRes();
                    Get.to(() => const VisitedRestaurantPage());
                  },
                  title: const BAPTText(
                    text: "Rate Restaurants",
                    fontWeight: FontWeight.bold,
                  ),
                  leading: Icon(
                    Icons.star,
                    color: Colors.black,
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: ListTile(
                  onTap: () {
                    rb.getRewardBought();
                    Get.to(() => const RewardBought());
                  },
                  title: const BAPTText(
                    text: "Reward Purchase",
                    fontWeight: FontWeight.bold,
                  ),
                  leading: Icon(
                    FontAwesomeIcons.gifts,
                    color: Colors.black,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: ListTile(
                  onTap: () {
                    rb.getRewardBought();
                    Get.to(() => const AllProducts());
                  },
                  title: const BAPTText(
                    text: "All Restaurants",
                    fontWeight: FontWeight.bold,
                  ),
                  leading: Icon(
                    Icons.fastfood_rounded,
                    color: Colors.black,
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 0),
              child: ListTile(
                  onTap: () {
                    ud.getUserDetal();
                    Get.to(() => const UserProfilePage());
                  },
                  title: const BAPTText(
                    text: "User Profile",
                    fontWeight: FontWeight.bold,
                  ),
                  leading: Icon(
                    FontAwesomeIcons.user,
                    color: Colors.black,
                  )),
            ),
            // bonListTile('Category', FontAwesomeIcons.layerGroup, "RestaurantPage()"),
            // Divider(),
            // bonListTile('Main Page', FontAwesomeIcons.home, 'restaurantDetails'),
            // bonListTile('Profile', Icons.person,'profile'),
            // bonListTile('Generate Coupon', FontAwesomeIcons.ticketAlt,'scratcher'),
            // bonListTile('Spin and Win', FontAwesomeIcons.gifts,'spinner'),
            const Divider(),
            ListTile(
              onTap: () async {
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.remove('email');
                // Get.offAll(const Login());

                 Map data = {};
              //  var response = await Api().postData(data, 'logout');
               var response = await Api().logOut(data, 'logout');
               var result = json.decode(response.body);
               print(result);
               print(response.statusCode);

               if (response.statusCode == 200){
                 SharedPreferences preferences = await SharedPreferences.getInstance();
                 preferences.remove("token");
                 Get.offAll(Login());
               }
               else{
                 errorSnackbar("User not logged in");
               }
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.remove('email');
                // Get.offAll(const LogInPage());
              },
              leading: const Icon(
                // FontAwesomeIcons.signOutAlt,
                Icons.logout_sharp,
                color: Colors.black,
              ),
              title: Text("Log out"),
              tileColor: Colors.white24,
            ),
          ],
        ),
      ),
    );
  }
}

//   ListTile bonListTile(String title, IconData iconData, String route) {
//     return ListTile(
//       onTap: () {
//         print(route);
//         // Navigator.pop(context);
//         // Navigator.pushNamed(context, route);
//         Get.to(() => route);
//       },
//       // trailing: Icon(Icons.arrow_right),
//       leading: FaIcon(
//         iconData,
//         size: 20,
//       ),
//       title: BText(
//         text: "$title",
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
// }
