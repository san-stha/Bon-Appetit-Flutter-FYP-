import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/components/my_drawer.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/controller/food_each_controller.dart';
import 'package:get/get.dart';

class FoodEachPage extends StatelessWidget {
  const FoodEachPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fe = Get.find<FoodEachController>();
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          actions: [
            TextButton.icon(
                // <-- TextButton
                onPressed: () {},
                //Icon(FontAwesomeIcons.ticketAlt)
                icon: const Icon(
                  FontAwesomeIcons.gem,
                  color: Color.fromRGBO(37, 126, 2, 1),
                  size: 20.0,
                ),
                label: BAPTText(
                  text: "10",
                  color: Color.fromRGBO(37, 126, 2, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                )),
          ],
          backgroundColor: Color.fromRGBO(8, 0, 49, 1),
          title: const Text("Restaurants"),
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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Row(
                //     children: [
                //       Expanded(
                //         flex: 2,
                //         child: Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Text(
                //             "Resturants",
                //             style: TextStyle(
                //                 fontWeight: FontWeight.bold, fontSize: 17),
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         flex: 2,
                //         child: BAPTText(text: rstl.restaurants.value.data.restaurantCategoryId.toString())
                //       ),
                //     ],
                //   ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: fe.foodEach.value.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        var mydata = fe.foodEach.value.data[index];
                        //   return  GFCard(
                        //   boxFit: BoxFit.cover,
                        //   // image: Image(image: NetworkImage(mydata.image.toString())),
                        //   title: GFListTile(

                        //     avatar: GFAvatar(
                        //       backgroundImage: AssetImage('your asset image'),
                        //     ),
                        //     title: Text('Card Title'),
                        //     subTitle: Text('Card Sub Title'),
                        //   ),
                        //   content: Image.network(mydata.image.toString()),
                        //   buttonBar: GFButtonBar(
                        //     children: <Widget>[
                        //       GFButton(
                        //         onPressed: () {},
                        //         text: 'Buy',
                        //       ),
                        //       GFButton(
                        //         onPressed: () {},
                        //         text: 'Cancel',
                        //       ),
                        //     ],
                        //   ),
                        // );

                        return Card(
                          child: Container(
                            child: InkWell(
                              onTap: () {
                                // Navigator.pushNamed(
                                //     context, 'restaurantDetails');
                                // rsfcl.getRestaurantFoodCategoryList(rstl
                                //     .restaurants.value.data[index].userId);
                                // print(rstl.restaurants.value.data[index].id);
                                // Get.to(() => const ResturantPage());
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Container(
                                  //   decoration: const BoxDecoration(
                                  //     // image: DecorationImage(image:
                                  //     // NetworkImage("https://images.pexels.com/photos/11319741/pexels-photo-11319741.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
                                  //     // ,
                                  //     // fit: BoxFit.contain,),
                                  //     // shape: BoxShape.rectangle
                                  //   ),
                                  //   child: Image.network("https://images.pexels.com/photos/11319741/pexels-photo-11319741.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                                  //   ),

                                  //       // Image.asset('images/product.jpg'),
                                  //       // NetworkImage()
                                  //       // Image.network(rc.restaurantList[index].image),
                                  //       // NetworkImage(rc.restaurantList[index].image);

                                  //     //  : NetworkImage(rc.restaurantList[index].image.toString());
                                  // ),
                                  Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 140,
                                      color: Colors.red,
                                      child:
                                          // Image.network(mydata.image,
                                          //     fit: BoxFit.cover),
                                          Text("Image")
                                      // Image.network("https://www.pexels.com/photo/cooked-food-704569/"),
                                      ),
                                  ListTile(
                                    // title: Text(rstl
                                    //     .restaurants.value.data[index].name
                                    //     .toString()),
                                    title: BAPTText(
                                        text: mydata.name.toString(),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                    subtitle: BAPTText(
                                      text: mydata.price.toString(),
                                      fontWeight: FontWeight.w300,
                                    ),
                                    // trailing: Icon(Icons.restaurant,
                                    //     color: Colors.black),
                                  ),
                                  
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
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
