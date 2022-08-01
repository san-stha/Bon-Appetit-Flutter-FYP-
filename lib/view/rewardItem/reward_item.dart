import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/components/error_snackbar.dart';
import 'package:fyp/components/my_drawer.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/controller/gems_history_controller.dart';
import 'package:fyp/controller/gems_points_controller.dart';
import 'package:fyp/controller/restaurant_category_controller.dart';
import 'package:fyp/controller/restaurant_list_controller.dart';
import 'package:fyp/controller/reward_item_controller.dart';
import 'package:fyp/service/remote_service.dart';
import 'package:fyp/view/gems/gems_history.dart';
import 'package:fyp/view/gems/gems_history.dart';
import 'package:fyp/view/login/login.dart';
import 'package:fyp/view/restaurant_list.dart/restaurant_list.dart';
import 'package:getwidget/getwidget.dart';
import 'package:fyp/view/global/global.dart' as globals;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RewardItemPage extends StatefulWidget {
  const RewardItemPage({Key? key}) : super(key: key);

  @override
  State<RewardItemPage> createState() => _RewardItemPageState();
}

class _RewardItemPageState extends State<RewardItemPage> {
  void checkToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var token = preferences.getString("token");
    if (token == null) {
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
    var gp = Get.find<GemsPointsController>();
    var ric = Get.find<RewardItemController>();
    var gh = Get.find<GemsHistoryController>();
    gp.getGemsPoints();
    print(globals.gemPoints.toString());
    print(gp.gemsPoints.value.points);

    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          actions: [
            TextButton.icon(
                // <-- TextButton
                onPressed: () {
                  // Get.to(() => GemsPage());
                  gh.getGemsHistory();
                  Get.to(() => const GemsHistoryPage());
                },
                //Icon(FontAwesomeIcons.ticketAlt)s
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
          backgroundColor: const Color.fromRGBO(8, 0, 49, 1),
          title: const Text("Rewards"),
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
              children: [
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ric.rewardItemList.value.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    var mydata = ric.rewardItemList.value.data[index];
                    return Card(
                        child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .90,
                            height: 170,
                            child: Image.network(
                              mydata.image!.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                          ListTile(
                              title: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0, bottom: 20.0),
                                child: Text(mydata.name!),
                              ),
                              trailing: const Icon(
                                FontAwesomeIcons.gift,
                                color: AppSetting.secondaryColor,
                              )),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: TextButton.icon(
                                  label: BAPTText(
                                    text: mydata.cost.toString(),
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  icon: const Icon(FontAwesomeIcons.gem,
                                      color: Colors.green),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: MaterialButton(
                                  color: AppSetting.secondaryColor,
                                  child: BAPTText(text: "BUY NOW"),
                                  onPressed: () async {
                                    Map data = {
                                      "name": mydata.name,
                                      // "deliveryCharge": ,
                                      "finder": mydata.finder,
                                      "cost": mydata.cost,
                                      "reward_item_id": mydata.id
                                    };

                                    print(data);
                                    await RemoteService.postData(
                                        'redeemRewardCust', data);

                                    Map gemData = {
                                      "points": mydata.cost!,
                                    };

                                    print(gemData);
                                    await RemoteService.postData(
                                        'reduceUserGem', gemData);
                                    gp.getGemsPoints();
                                    // print(gp.gemsPoints.value.points);
                                    gp.gemsPoints.value.points =
                                        globals.gemPoints;
                                  },
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
