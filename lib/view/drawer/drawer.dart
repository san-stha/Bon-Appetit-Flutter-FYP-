import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/const/text.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: AppSetting.primaryColor),
              accountName: Text('Bon Appetit'),
              accountEmail: Text('san.stha@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: AppSetting.ancentText,
                child: Text(
                  'G',
                  style: TextStyle(color: AppSetting.primaryText),
                ),
              ),
            ),

            bonListTile('Category', FontAwesomeIcons.layerGroup, 'category'),
            Divider(),
            bonListTile('Main Page', FontAwesomeIcons.home, 'dashboard'),
            bonListTile('Profile', Icons.person,'profile'),
            bonListTile('Generate Coupon', FontAwesomeIcons.ticketAlt,'scratcher'),
            bonListTile('Spin and Win', FontAwesomeIcons.gifts,'spinner'),
            const Divider(),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '');
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
  ListTile bonListTile(String title, IconData iconData, String route) {
    return ListTile(
      onTap: () {
        print(route);

        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
      // trailing: Icon(Icons.arrow_right),
      leading: FaIcon(
        iconData,
        size: 20,
      ),
      title: BText(
        text: "$title",
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
