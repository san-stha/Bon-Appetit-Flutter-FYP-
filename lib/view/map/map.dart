import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fyp/components/bapt_text.dart';
import 'package:fyp/const/app_settings.dart';
import 'package:fyp/controller/lat_long_res_controller.dart';
import 'package:fyp/controller/restaurantController.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:fyp/view/global/global.dart' as globals;
import 'package:maps_toolkit/maps_toolkit.dart' as mp;

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
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

  // var long = 0.0;
  // var lat = 0.0;
  // void getlocation() async {
  //   LocationPermission per = await Geolocator.checkPermission();
  //   if (per == LocationPermission.denied ||
  //       per == LocationPermission.deniedForever) {
  //     print("permission denied");
  //     LocationPermission per1 = await Geolocator.requestPermission();
  //   } else {
  //     Position currentLoc = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.best);
  //     setState(() {
  //       long = currentLoc.longitude.toDouble();
  //       lat = currentLoc.latitude.toDouble();
  //       print(long);
  //       print(lat);
  //     });
  //   }
  // }

  // void getDistance() async {
  //   var dist = mp.SphericalUtil.computeDistanceBetween(
  //       mp.LatLng(26.8093298, 87.2522646), mp.LatLng(26.815645, 87.259662));
  //   print("distance");
  //   print(dist);
  //   //26.815195, 87.269002
  // }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getDistance();
  // }

  @override
  Widget build(BuildContext context) {
    var res = Get.find<RestaurantController>();
    var marker = <Marker>[];
    var circle = <CircleMarker>[];
 
    circle = [
      CircleMarker(
          useRadiusInMeter: true,
          borderStrokeWidth: 1,
          borderColor: AppSetting.primaryColor,
          color: AppSetting.primaryColor.withOpacity(0.2),
          point: LatLng(globals.lat, globals.long),
          radius: globals.distance)
    ];
    return Scaffold(
      body:
          FlutterMap(
        options: MapOptions(
            maxZoom: 21.0,
            center: LatLng(globals.lat, globals.long),
            zoom: 14.45),
        layers: [
          TileLayerOptions(
            retinaMode: false,
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
              markers: res.restaurantList.value.data.map((e) {
            return Marker(
                point: LatLng(e.latitude!, e.longitude!),
                builder: (context) =>
                    // const Icon(Icons.pin_drop, color: Colors.blue),
                    Column(
                      children: [
                        const Flexible(
                          flex: 8,
                          child: Icon(
                            Icons.pin_drop,
                            color: Colors.red,
                            // size: 15.0,
                            // textDirection: hospitalDetails['hospitalName']!,
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.loose,
                          flex: 1,
                          child: BAPTText(
                            text: e.name!,
                            color: Colors.black,
                            fontSize: 7,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ));
          }).toList()),
          MarkerLayerOptions(markers: [
            Marker(
              // point: LatLng(26.815674, 87.263948),
              point: LatLng(globals.lat, globals.long),

              builder: (context) => const Icon(Icons.person_pin_circle_outlined,
                  size: 40, color: AppSetting.primaryColor),
            )
          ]),
          CircleLayerOptions(circles: circle)
        ],
      ),
    );
  }
}
