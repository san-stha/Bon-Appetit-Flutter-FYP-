import 'package:flutter/material.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/controller/coupon_controller.dart';
import 'package:fyp/controller/gems_points_controller.dart';
import 'package:fyp/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:fyp/view/dashboard/dashboard.dart';
import 'package:fyp/view/login/login.dart';
import 'package:fyp/view/restaurant_details/restaurant_details.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fyp/view/global/global.dart' as globals;

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
// void checkAuth(){
//   Future.delayed(const Duration(seconds: 6), (){
//     Get.off(() => const Bottom_nav_bar());
//   });
// }

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     checkAuth();
//   }
  var gp = Get.find<GemsPointsController>();
  var cp = Get.find<CouponController>();
  Future checkAuth() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    var token = preferences.getString("token");
    // preferences.remove("token");
    print(token);
    if (token != null) {
      Future.delayed(Duration(seconds: 1), () {
        // Navigator.popAndPushNamed(context, 'home');
        print("i have token");
        cp.getCouponList();
        gp.getGemsPoints();
        gp.gemsPoints.value.points = globals.gemPoints;
        Get.off(() => const Bottom_nav_bar());
      });
    } else {
      Future.delayed(Duration(seconds: 1), () {
        // Navigator.popAndPushNamed(context, 'skip');
        print("noooo token");
        Get.off(() => Login());
      });
    }
    // Future.delayed(const Duration(seconds: 3),(){

    //   Get.off(() => const SkipScreen());
    // });

    // Future.delayed(Duration(seconds: 1),(){
    //   Navigator.popAndPushNamed(context, 'login');
    // });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkAuth();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: AppSetting.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .25,
              ),
              SizedBox(
                height: height * .35,
                width: width * .90,
                child: Image.asset(
                  'images/splash.png',
                ),
              ),
              SizedBox(
                height: height * .30,
                child: const Center(
                    child: BAPTText(
                  text: "Have a good MEAL !",
                  color: Colors.white,
                  fontSize: 16,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
