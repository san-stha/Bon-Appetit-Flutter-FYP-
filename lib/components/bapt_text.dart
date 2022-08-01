import 'package:flutter/material.dart';
import 'package:fyp/const/app_settings.dart';


class BAPTText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final TextOverflow textOverflow;

  const BAPTText(
      {Key? key,
      required this.text,
      this.color = AppSetting.primaryText,
      this.fontSize = 14.0,
      this.fontWeight = FontWeight.normal,
      this.textOverflow = TextOverflow.visible,
      this.maxLines = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      // ignore: unnecessary_string_interpolations
      "$text",
      style: TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
      overflow: textOverflow,
      maxLines: maxLines,
    );
  }
}