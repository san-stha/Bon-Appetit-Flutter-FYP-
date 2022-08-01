import 'package:flutter/material.dart';
import 'package:fyp/const/app_settings.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppSetting.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, 'dashboard');
          },
          icon: Icon(Icons.close),
        ),
        title: const Text(
          "Category",
          style: TextStyle(color: AppSetting.ancentColor),
        ),
      ),
      body: Column(
        children: [
          categoryButton(context, 'product', 'Indian'),
          categoryButton(context, 'product', 'Cafe'),
          categoryButton(context, 'product', 'Drinks'),
          categoryButton(context, 'product', 'Fine Dinning'),
        ],
      ),
    ));
  }
}

Card categoryButton(BuildContext context, String route, String title) {
  return Card(
    color: Color.fromRGBO(250, 250, 250, 1),
    shadowColor: Colors.grey[300],
    child: ListTile(
      onTap: () {
        Navigator.popAndPushNamed(context, route);
      },
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  );
}
