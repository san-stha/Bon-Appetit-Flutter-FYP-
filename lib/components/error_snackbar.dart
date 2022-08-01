import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController errorSnackbar(String message) {
  return Get.snackbar("Bon Appetit",
  message,
      // "Please input '1000' meters to greater number to view more nearby restaurants!",
      // colorText: Colors.white,
      borderWidth: 3,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      borderColor: Colors.red[900],
      // backgroundColor: Color.fromRGBO(255, 191, 0, .6),
      backgroundColor: Color.fromRGBO(255, 255, 255, .6),
      // backgroundColor: Colors.wh,
      icon: Icon(
        Icons.info,
        // color: Colors.amber[700],
        color: Colors.red[900],
      ),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      barBlur: 10);
}
