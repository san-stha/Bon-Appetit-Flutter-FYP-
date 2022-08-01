import 'package:flutter/material.dart';
import 'package:fyp/algo/search.dart';
import 'package:fyp/view/binding/controller_binding.dart';
import 'package:fyp/view/category/category.dart';
import 'package:fyp/view/coupon/generate.dart';
import 'package:fyp/view/dashboard/dashboard.dart';
import 'package:fyp/view/food_each/food_each.dart';
import 'package:fyp/view/login/login.dart';
import 'package:fyp/view/register/register.dart';
import 'package:fyp/view/restaurant_details/restaurant_details.dart';
import 'package:fyp/view/scratcher/scratcher.dart';
import 'package:fyp/view/spinner/spinner.dart';
import 'package:fyp/view/splash/splash.dart';
import 'package:get/get.dart';
// import 'package:fyp/view/splash/splash.dart';

void main() {
  runApp(const MyApp());
  // List<int> arr = [0, 1, 3, 4, 5, 8, 9, 22];
  // int userValue = 3;
  // int min = 0;
  // int max = arr.length - 1;
  // binarySearch(arr, userValue, min, max);
  // List<int> list = [0, 2, 5, 8, 10, 12, 15];
  // print(linearSearch(list, 8));
  // print(binarySearch(list, 10));
      
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.zoom,
      initialBinding: ControllerBinding(),
      home: const SplashPage(),
      routes: {
        // "/": (context) => const Login(),
        // "register": (context) => const Register(),
        // "login": (context) => const Login(),
        // "scratcher": (context) => const ChooseScreen(),
        // "spinner": (context) => const RewardPage(),
        "restaurantDetails": (context) => const ResturantPage(),
        // "dashboard": (context) => const HomePage(),
        // "category": (context) => const CategoryPage(),

      },
    );
  }
}







