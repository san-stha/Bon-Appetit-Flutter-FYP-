import 'package:flutter/material.dart';
import 'package:fyp/controller/restaurant_category_controller.dart';
import 'package:fyp/controller/restaurant_list_controller.dart';
import 'package:fyp/view/restaurant_list.dart/restaurant_list.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';

class RestaurantCategoryPage extends StatefulWidget {
  const RestaurantCategoryPage({Key? key}) : super(key: key);

  @override
  State<RestaurantCategoryPage> createState() => _RestaurantCategoryPageState();
}

class _RestaurantCategoryPageState extends State<RestaurantCategoryPage> {
  @override
  Widget build(BuildContext context) {
    var rc = Get.find<RestaurantListController>();
    var rcat = Get.find<RestaurantCategoryController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: rcat.restaurantCategoryList.value.data.length,
              itemBuilder: (BuildContext context, int index) {
                // return Card(
                //   child: InkWell(
                //     onTap: () {
                //       rc.getRestaurantList(rcat.restaurantCategoryList[index].id);
                //       Get.to(()=> const RestaurantListPage());
                //       // Navigator.pushNamed(
                //       //     context, 'restaurantDetails');
                //       // Get.to(() => const ResturantPage());
                //     },
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         // Container(
                //         //   decoration: const BoxDecoration(
                //         //     // image: DecorationImage(image:
                //         //     // NetworkImage("https://images.pexels.com/photos/11319741/pexels-photo-11319741.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
                //         //     // ,
                //         //     // fit: BoxFit.contain,),
                //         //     // shape: BoxShape.rectangle
                //         //   ),
                //         //   child: Image.network("https://images.pexels.com/photos/11319741/pexels-photo-11319741.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                //         //   ),

                //         //       // Image.asset('images/product.jpg'),
                //         //       // NetworkImage()
                //         //       // Image.network(rc.restaurantList[index].image),
                //         //       // NetworkImage(rc.restaurantList[index].image);

                //         //     //  : NetworkImage(rc.restaurantList[index].image.toString());
                //         // ),
                //         ListTile(
                //           title: Text(rcat.restaurantCategoryList[index].name
                //               .toString()),
                //         ),

                //       ],
                //     ),
                //   ),
                // );
                //
                // return ListWheelScrollView(itemExtent: 280, children: [
                //   Container(
                //     height: 100,
                //     decoration: BoxDecoration(
                //       color: Colors.teal,
                //       borderRadius: BorderRadius.circular(15),
                //     ),
                //     child: Center(
                //       child:Text(rcat.restaurantCategoryList[index].name
                //               .toString()),
                //     ),
                //   )
                // ]);
                return GFListTile(
                  onTap: (){
                      rc.getRestaurantList(rcat.restaurantCategoryList.value.data[index].id!);
                      Get.to(()=> const RestaurantListPage());
                  },
                    titleText: rcat.restaurantCategoryList.value.data[index].name
                              .toString(),
                    subTitleText:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing',
                    icon: Icon(Icons.favorite));
              },
            ),
          ],
        ),
      ),
    );
  }
}
