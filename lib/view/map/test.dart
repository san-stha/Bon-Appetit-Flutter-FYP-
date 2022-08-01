import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';

class HospitalMap extends StatelessWidget {
  static const routeName = '/hospitalMap';

  @override
  Widget build(BuildContext context) {
    final Map<String, String> hospitalDetails =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor, //Colors.white,
        title: Text(
          hospitalDetails['hospitalName']!,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white //Colors.black,
            ),
      ),
      body: FlutterMap(
        options: MapOptions(
          maxZoom: 18.0,
          center: LatLng(
            double.parse(hospitalDetails['hospitalLatitude']!),
            double.parse(hospitalDetails['hospitalLongitude']!),
          ),
          zoom: 17.0,
          // bounds: LatLngBounds(
          //   LatLng(
          //     double.parse(hospitalDetails['hospitalLatitude']!),
          //     double.parse(hospitalDetails['hospitalLongitude']!),
          //   ),
          //   LatLng(lat, long),
          // ),
        ),
        layers: [
          TileLayerOptions(
            retinaMode: false,
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                height: 100.0,
                width: 200.0,
                point: LatLng(
                  double.parse(hospitalDetails['hospitalLatitude']!),
                  double.parse(hospitalDetails['hospitalLongitude']!),
                ),
                builder: (context) => Container(
                  // color: Colors.black,
                  child: Column(
                    children: [
                      const Icon(
                        Icons.pin_drop,
                        color: Colors.red,
                        size: 55.0,
                        // textDirection: hospitalDetails['hospitalName']!,
                      ),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          hospitalDetails['hospitalName']!,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontSize: 16,
                                    color: Colors.red[900],
                                    fontWeight: FontWeight.w700,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
