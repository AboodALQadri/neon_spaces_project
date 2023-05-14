import 'package:flutter/material.dart';

Widget smallElevatedButtonWidget({
  required VoidCallback? onPress,
  required String title,
  required Color? titleColor,
  required Color backgroundColor,
  Color? borderColor,
}) {
  return SizedBox(
    width: 164.0,
    height: 48.0,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: titleColor,
        backgroundColor: backgroundColor,
        textStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
        side: BorderSide(color: borderColor ?? Colors.transparent),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
      onPressed: onPress,
      child: Text(title),
    ),
  );
}
