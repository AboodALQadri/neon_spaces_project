import 'package:flutter/material.dart';
import 'package:neon_spaces/core/utils/app_colors.dart';

Widget textFieldComponent({
  required TextEditingController controller,
  required String title,
  required String hintText,
  required IconData icon,
  TextInputType? keyboardType,
  bool isPassword = false,
  String? Function(String?)? validator,
  bool readOnly = false,
  Function()? onPressedIcon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontFamily: "DIN",
          fontSize: 15,
        ),
      ),
      const SizedBox(height: 5.0),
      TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: isPassword,
        readOnly: readOnly,
        cursorColor: AppColors.primaryColor,

        decoration: InputDecoration(
          // suffixIcon: Icon(icon, color: AppColors.icons),
          suffixIcon: IconButton(
            onPressed: onPressedIcon,
            icon: Icon(
              icon,
              color: AppColors.icons,
            ),
          ),

          fillColor: Colors.white,
          filled: true,

          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColors.grey,
            fontSize: 13,
            fontWeight: FontWeight.w300,

          ),
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
        validator: validator,
      ),
    ],
  );
}
