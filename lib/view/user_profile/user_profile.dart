import 'package:flutter/cupertino.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/controller/user_detail_model.dart';
import 'package:fyp/view/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:fyp/view/global/global.dart' as globals;

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  var ud = Get.find<UserDetailController>();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        centerTitle: true,
        backgroundColor: AppSetting.primaryColor,
      ),
      body: Obx(() => ud.loading.value ? const Center(child: CupertinoActivityIndicator(),)
      : ud.userDetail.value.email!.isEmpty ? const Center (child: Text("user email not found"),)
      :ud.userDetail.value.name!.isEmpty ? const Center (child: Text("user name not found"),)
      : SingleChildScrollView(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              children: [
                ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 120,
                    color: AppSetting.primaryColor,
                    child: Center(child: Text("WaveClipperTwo()")),
                  ),
                ),
                const SizedBox(
                  // height: MediaQuery.of(context).size.height * .30,
                  height: 110,
                ),
                 ListTile(
                  leading: Icon(Icons.person, color: Colors.black,),
                  title: BAPTText(
                    text: "Name : ",
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: BAPTText(
                      text: ud.userDetail.value.name!, fontWeight: FontWeight.bold),
                ),
                 ListTile(
                  leading: Icon(Icons.email_sharp, color: Colors.black,),
                  title: BAPTText(
                    text: "Email Address : ",
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: BAPTText(
                      text: ud.userDetail.value.email!, fontWeight: FontWeight.bold),
                ),
                 ListTile(
                  leading: Icon(Icons.phone, color: Colors.black,),
                  title: BAPTText(
                    text: "Phone Number : ",
                    fontWeight: FontWeight.bold,
                  ),
                  trailing: BAPTText(
                      text: ud.userDetail.value.phoneNumber!.toString(), fontWeight: FontWeight.bold),
                ),
                //  ListTile(
                //   leading: Icon(FontAwesomeIcons.gem, color: Colors.black,),
                //   title: BAPTText(
                //     text: "Gems : ",
                //     fontWeight: FontWeight.bold,
                //   ),
                //   trailing: BAPTText(
                //       text: ud.userDetail.value.ge!, fontWeight: FontWeight.bold),
                // ),
              ],
            ),
            Positioned(
                top: 40,
                left: MediaQuery.of(context).size.height * .16,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: AppSetting.primaryColor,
                        border: Border.all(color: Colors.white, width: 4)),
                    width: 160,
                    height: 160,
                    child: Icon(
                      Icons.person,
                      size: 140,
                      color: Colors.white,
                    )))
          ],
        ),
      ),
      )
    );
  }
}
