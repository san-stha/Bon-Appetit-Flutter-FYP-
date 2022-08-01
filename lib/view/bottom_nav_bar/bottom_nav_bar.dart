import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/view/coupon/generate.dart';
import 'package:fyp/view/dashboard/dashboard.dart';
import 'package:fyp/view/gems/gems_history.dart';
import 'package:fyp/view/map%20button/map_button.dart';
import 'package:fyp/view/map/map.dart';
import 'package:fyp/view/restaurant_category/restaurant_category.dart';
import 'package:fyp/view/restaurant_details/restaurant_details.dart';
import 'package:fyp/view/rewardItem/reward_item.dart';
import 'package:fyp/view/scratcher/scratcher.dart';
import 'package:fyp/view/search/search.dart';
import 'package:fyp/view/spinner/spinner.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class Bottom_nav_bar extends StatefulWidget {
  const Bottom_nav_bar({ Key? key }) : super(key: key);

  @override
  State<Bottom_nav_bar> createState() => _Bottom_nav_barState();
}

class _Bottom_nav_barState extends State<Bottom_nav_bar> {
  int barIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        // type: BottomNavigationBarType.fixed,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape: SnakeShape.rectangle,
        snakeViewColor: Colors.white,
        shape: const RoundedRectangleBorder(side: BorderSide(color: AppSetting.primaryColor, width: 4),borderRadius: BorderRadius.all(Radius.circular(0)),),
        // padding: EdgeInsets.all(10),
        backgroundColor: AppSetting.primaryColor,
        selectedItemColor: Colors.black,
        // selectedFontSize: 14.0,
        selectedLabelStyle: TextStyle(),
        unselectedItemColor: Colors.white,

        // unselectedFontSize: 4.0,
        unselectedLabelStyle: TextStyle(fontFamily: "monospace"),
        onTap: (int value) {
          // donkey = value;
          setState(() {
            barIndex = value;
          });
        },
        currentIndex: barIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
            activeIcon: Icon(
              Icons.home_filled,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_rounded,
            ),
            label: "Search",
            activeIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.map,
              color: Colors.black,
            ),
            icon: Icon(Icons.map_outlined),
            label: "Map",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              FontAwesomeIcons.ticketAlt,
              color: Colors.black,
            ),
            icon: Icon(FontAwesomeIcons.ticketAlt),
            label: "Coupon",
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              FontAwesomeIcons.gift,
              color: Colors.black,
            ),
            icon: Icon(FontAwesomeIcons.gift),
            label: "Reward",
          ),
        ],
      ),
      body: barIndex == 0
          ? const HomePage()
          : barIndex == 1
           ? const SearchPage()
              : barIndex == 2
              ? const MapButtonPage()
              : barIndex == 3
                  ? const GenerateCoupon()
                  : const RewardItemPage(),
    );
  }
}