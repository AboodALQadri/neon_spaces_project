import 'package:flutter/material.dart';
import 'package:neon_spaces/core/utils/app_colors.dart';

Widget textFieldWidget({
  required TextEditingController controller,
  required String hintText,
  TextInputType? textInputType,
  Function? validator,
  VoidCallback? onTap,
  Widget? suffixIcon,
  Widget? prefixIcon,
  bool readOnly = false,
  Function(String? value)? onSaved,
  Function(String? value)? onChanged,
}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: textInputType,
    validator: (value) => validator!(value),
    onTap: onTap,
    readOnly: readOnly,
    onSaved: onSaved,
    onChanged: onChanged,
    decoration: InputDecoration(
      // fillColor: AppColors.container,
      // filled: true,
      hintText: hintText,
      hintStyle: TextStyle(
        fontFamily: 'DIN',
        color: AppColors.black,
        fontSize: 13,
        fontWeight: FontWeight.w300,
      ),
      suffixIcon: suffixIcon,
      suffixIconColor: AppColors.black,
      prefixIcon: prefixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.black,
          width: 0.25,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.black,
          width: 0.25,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.black,
          width: 0.25,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.red,
          width: 0.25,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.black,
          width: 0.25,
        ),
      ),
    ),
  );
}
