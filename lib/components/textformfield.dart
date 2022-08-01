import 'package:flutter/material.dart';

Widget textForm(TextEditingController controller, String labelText) {
  return TextFormField(
    controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
    contentPadding: const EdgeInsets.all(8),
    fillColor: Colors.white,
    filled: true,
    border: const OutlineInputBorder(),
    
  ));
}
