import 'dart:convert';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/components/info_snackbar.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/const/controllers.dart';
import 'package:fyp/controller/lat_long_res_controller.dart';
import 'package:fyp/controller/restaurantController.dart';
import 'package:fyp/view/map/map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:fyp/view/global/global.dart' as globals;

class MapButtonPage extends StatefulWidget {
  const MapButtonPage({Key? key}) : super(key: key);

  @override
  State<MapButtonPage> createState() => _MapButtonPageState();
}

class _MapButtonPageState extends State<MapButtonPage> {
  // var lat;
  // var long;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getCurrentLocation();
  // }

  // getCurrentLocation() async {
  //   final geoposition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  //   setState(() {
  //     lat = '${geoposition.latitude}';
  //     long = '${geoposition.longitude}';
  //     print(lat);
  //     print(long);
  //   });
  // }

  void getlocation() async {
    LocationPermission per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      print("permission denied");
      LocationPermission per1 = await Geolocator.requestPermission();
    } else {
      Position currentLoc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        globals.long = currentLoc.longitude.toDouble();
        globals.lat = currentLoc.latitude.toDouble();
        print(globals.long);
        print(globals.lat);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocation();
  }

  @override
  Widget build(BuildContext context) {
    var res = Get.find<RestaurantController>();
    // var ll = Get.find<LatLongResController>();
    // print (ll.latLongList.value);

    // var df = res.restaurantList.value.data[index];
    // var data = json.decode(res);
    var marker = <Marker>[];
    // for (var item in data) {
    //   // marker mc = new Marker(
    //   //   id: item['id'],
    //   //   name: item['name'],
    //   // );
    //   Marker(
    //     point: LatLng(26.8122, 87.2798),
    //     builder: (context) => const Icon(Icons.pin_drop, color: Colors.blue),
    //   );

    //   setState(() {
    //     mainCategories.add(mc);
    //     isLoading = false;
    //   });
    // }
    // marker = [
    //   Marker(
    //     point: LatLng(26.8122, 87.2798),
    //     builder: (context) => const Icon(Icons.pin_drop, color: Colors.blue),
    //   ),
    //   Marker(
    //     point: LatLng(26.8126, 87.2791),
    //     builder: (context) => const Icon(
    //       Icons.pin_drop,
    //       color: Colors.red,
    //     ),
    //   ),
    //   Marker(
    //     width: 300,
    //     point: LatLng(lat, long),
    //     builder: (context) => const Icon(Icons.person, color: Colors.black),
    //   ),
    // ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
        centerTitle: true,
        backgroundColor: AppSetting.primaryColor,
      ),
      body: Column(
        children: [
          ListTile(
            title: const Text("View nearby restaurants"),
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (builder) {
                        return AlertDialog(
                          elevation: 20,
                          title: Text("Please enter distance"),
                          content: TextField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: "in metres",
                            ),
                            controller: distance,
                          ),
                          // const Text("Invalid email or password"),
                          actions: [
                            ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppSetting.primaryColor),
                                ),
                                onPressed: () {
                                  // print(distance.text);

                                  if ((distance.text).isEmpty) {
                                    print(distance.text);
                                    distance.text = '1.0';
                                    infoSnackbar("Please input '1000' meters to greater number to view more nearby restaurants!");
                                  }
                                  globals.distance =
                                      double.parse(distance.text);
                                  distance
                                      .clear(); 
                                  Get.to(() => MapPage());
                                },
                                child: Text("OK"))
                          ],
                        );
                      });
                },
                icon: const Icon(
                  Icons.remove_red_eye_outlined,
                  color: AppSetting.primaryColor,
                  size: 30,
                )),
          ),
          Flexible(
            child: FlutterMap(
              options: MapOptions(
                  maxZoom: 21.0,
                  center: LatLng(27.7172, 85.3240),
                  // bounds: LatLngBounds(LatLng(29.9711, 29.9711), LatLng(29.9711, 88.0803)),
                  zoom: 5.6),
              layers: [
                TileLayerOptions(
                  retinaMode: false,
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayerOptions(
                    markers: res.restaurantList.value.data.map((e) {
                  return Marker(
                    // point: LatLng(26.815674, 87.263948),
                    point: LatLng(e.latitude!, e.longitude!),
                    builder: (context) =>
                        const Icon(Icons.pin_drop, color: Colors.red),
                  );
                }).toList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
