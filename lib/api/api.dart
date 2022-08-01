// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:fyp/view/login/login.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  String baseURL = "http://192.168.254.29:8000/api/";

  Future getData(String endPoint) async {
    String url = baseURL + endPoint;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    var response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token'
    });
    print(response);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      return data;
    } else {
      return null;
    }
  }

  // Delete
  Future delete(String endPoint) async {
    String url = baseURL + endPoint;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");

    var response = await http.delete(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token'
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      print(data);
      return data;
    } else {
      return null;
    }
  }

  Future postData(Map data, String endPoint) async {
    String url = baseURL + endPoint;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");

    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token'
        },
        body: jsonEncode(data));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      return data;
    } else {
      return null;
    }
  }

  Future loginAndRegister(Map data, String endPoint) async {
    String url = baseURL + endPoint;
    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(data));

    return response;
  }

  Future logOut(Map data, String endPoint) async {
    String url = baseURL + endPoint;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // String? token = preferences.getString("token");
    var token = preferences.getString("token");

    var response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));
    print(response.statusCode);
    return response;
    //  if (response.statusCode == 200) {
    //     var jsonString = response.body;
    //     return cartModelFromJson(jsonString);
    //   } else {
    //     return null;
    //   }
  }

}
