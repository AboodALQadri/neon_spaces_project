import 'package:flutter/material.dart';

Widget textUtils({
  required String text,
  required Color color,
  required FontWeight fontWeight,
  required double fontSize,
  TextDecoration? underLine,
  TextOverflow? overFlow,
  double? height,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    textAlign: textAlign,
    style: TextStyle(
      fontFamily: 'DIN',
      decoration: underLine,
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
      overflow: overFlow,
      height: height,
    ),
  );
}
