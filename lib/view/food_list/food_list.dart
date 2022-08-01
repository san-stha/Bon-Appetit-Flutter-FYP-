import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/controller/ascending_price_controller.dart';
import 'package:fyp/controller/descending_price_controller%20copy.dart';
import 'package:fyp/controller/food_category_food_list_controller.dart';
import 'package:fyp/controller/food_controller.dart';
import 'package:fyp/controller/food_each_controller.dart';
import 'package:fyp/controller/restaurant_food_category_list_controller.dart';
import 'package:fyp/model/food_category_food_list_model.dart';
import 'package:fyp/view/asc_food/asc_food.dart';
import 'package:fyp/view/desc_food/desc_food.dart';
import 'package:fyp/view/food_each/food_each.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:fyp/view/global/global.dart' as globals;
import 'package:get/get.dart';

class FoodCategoryFoodListPage extends StatefulWidget {
  const FoodCategoryFoodListPage({Key? key}) : super(key: key);

  @override
  State<FoodCategoryFoodListPage> createState() =>
      _FoodCategoryFoodListPageState();
}

class _FoodCategoryFoodListPageState extends State<FoodCategoryFoodListPage> {
  @override
  Widget build(BuildContext context) {
    var fcfl = Get.find<FoodCategoryFoodListController>();
    var fe = Get.find<FoodEachController>();
    var ap = Get.find<AscendingPriceController>();
    var dp = Get.find<DescendingPriceController>();
    var dropdown;
    // int quantity = 1;
    //   incrementValueChanged() {
    //   setState(() {
    //     quantity++;
    //   });
    // }

    // decrementValueChanged() {
    //   if (quantity > 1) {
    //     setState(() {
    //       quantity--;
    //     });
    //   }
    // }
    List<String> filter = ['Desc', 'Asc'];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(8, 0, 49, 1),
          title: const Text("Resturant"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, 'dashboard');
            },
            icon: Icon(Icons.close),
          ),
        ),
        body: Obx(() => 
        
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(child: Text('Sort By:')),
                    Expanded(
                      flex: 2,
                      child: DropdownButton<String>(
                        // value: category,
                        isExpanded: true,
                        items: filter.map((value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          // incomeCategory = value;
                          // print(value);
                          // setState(() {});

                          // dp.getDecPriceFood(globals.category_id);
                          if (value == "Desc") {
                            dp.getDecPriceFood(globals.category_id);
                            Get.off(() => const DescFoodPage());
                          } else if (value == "Asc") {
                            ap.getAscPriceFood(globals.category_id);
                            Get.off(() => const AscFoodPage());
                          }
                        },
                        hint: Text("Price"),
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: fcfl.foodCategoryFoodList.value.data.length,
                itemBuilder: (BuildContext context, int index) {
                  var mydata = fcfl.foodCategoryFoodList.value.data[index];
                  return InkWell(
                    onTap: () {
                      // fcfl.getFoodCategoryFoodList(mydata.id);
                      // Get.to("page")
                      fe.getFoodEachDetail(mydata.id);
                      Get.to(() => const FoodEachPage());
                      print("object");
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10,),
                      child: Container(
                        height: 250,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              child: Image.network(
                                mydata.image,
                                fit: BoxFit.cover,
                                height: 120,
                                width: double.infinity,
                              ),
                            ),

                            // BAPTText(text: mydata.name),
                            // BAPTText(text: mydata.price.toString()),
                            SizedBox(
                              height: 50,
                              child: ListTile(
                                title: BAPTText(
                                  text: mydata.name,
                                  fontWeight: FontWeight.bold,
                                ),
                                subtitle: BAPTText(text: "Rs. " + mydata.price.toString()),
                              ),
                            )

                            // SizedBox(
                            //   height: 100,
                            //   child: ListTile(
                            //     // title: Text(rstl
                            //     //     .restaurants.value.data[index].name
                            //     //     .toString()),
                            //     title: BAPTText(
                            //         text: mydata.name
                            //             .toString(),
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.bold),
                            //     subtitle: BAPTText(
                            //       text: mydata.price
                            //           .toString(),
                            //       fontWeight: FontWeight.w300,
                            //     ),
                            //     // trailing: Icon(Icons.restaurant,
                            //     //     color: Colors.black),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 10),
                            //   child: RatingBar.builder(
                            //     updateOnDrag: false,
                            //     ignoreGestures: true,
                            //     itemSize: 20,
                            //     initialRating: 3.5,
                            //     // initialRating: 4,
                            //     minRating: 1,
                            //     direction: Axis.horizontal,
                            //     allowHalfRating: true,
                            //     itemCount: 5,
                            //     itemPadding: const EdgeInsets.symmetric(
                            //         horizontal: 2.0),
                            //     itemBuilder: (context, _) => const Icon(
                            //       Icons.star,
                            //       color: Colors.amber,
                            //     ),
                            //     onRatingUpdate: (rating) {
                            //       print(rating);
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),)
      ),
    );
  }
}
