import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:neon_spaces/core/utils/app_colors.dart';

class Constants {
  static bool isAdmin = false;

  static String? indexValue;
  static dynamic conditionType;
  static dynamic region;
  static dynamic countPhotos;
  static dynamic countVideos;
  static dynamic countWorkers;
  static dynamic deliveryArea;
  static dynamic executionTime;
  static dynamic numberPerson;
  static dynamic photographyType;
  static dynamic polishType;
  static dynamic residentialUnit;
  static dynamic spareParts;
  static const String emptyImage =
      "https://envothemes.com/envo-magazine-pro/wp-content/uploads/sites/8/2018/04/no-image.jpg";
  static String validationEmail =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String validationPinCode = "^[1-9]{1}[0-9]{2}\\s{0,1}[0-9]{3}";

  static String? recoveryEmail;
  static String? recoveryCode;

  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                msg,
                style: const TextStyle(color: Colors.black, fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Ok'),
                ),
              ],
            ));
  }

  static void showToast({
    required String msg,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      msg: msg,
      backgroundColor: color ?? AppColors.primaryColor,
      gravity: gravity ?? ToastGravity.BOTTOM,
    );
  }

  static Widget scaffoldComponent({
    required String appBarTitle,
    bool centerTitle = true,
    Widget? body,
    Widget? bottomNavigationBar,
    Widget? leading,
    List<Widget>? actions,
  }) {
    return Scaffold(
      appBar: AppBar(
        leading: leading,
        title: Text(
          appBarTitle,
          style: TextStyle(
            color: AppColors.black,
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: centerTitle,
        actions: actions,
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: body,
      ),
    );
  }

  static Widget scaffoldComponentForSearch({
    required Widget appBar,
    bool centerTitle = true,
    Widget? body,
    Widget? bottomNavigationBar,
    Widget? leading,
    List<Widget>? actions,
  }) {
    return Scaffold(
      appBar: AppBar(
        leading: leading,
        title: appBar,
        centerTitle: centerTitle,
        actions: actions,
      ),
      bottomNavigationBar: bottomNavigationBar,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: body,
      ),
    );
  }
}
