import 'package:flutter/material.dart';
import 'package:neon_spaces/core/utils/app_colors.dart';

Widget elevatedButtonForWidget({
  // required Function() onPressed,
  required  void Function()? onPressed,
  required Widget child,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 56),
        backgroundColor: AppColors.primaryColor,
        // primary: MyColors.kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center),
    onPressed: onPressed,
    child: child,
  );
}
