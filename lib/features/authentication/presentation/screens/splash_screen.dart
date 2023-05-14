import 'dart:async';
import 'package:flutter/material.dart';
import 'package:neon_spaces/config/routes/app_routes.dart';
import 'package:neon_spaces/core/utils/assets_manager.dart';
import '../../../../core/utils/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Routes.loginScreenRoute);

      // String routeFee = SharedPrefController().loggedIn
      //     ? Routes.freelancerMainScreen
      //     : Routes.chooseUser;
      // String routeRe = SharedPrefController().loggedIn
      //     ? Routes.recruiterMainScreen
      //     : Routes.chooseUser;
      //
      // SharedPrefController().isAdmin
      //     ? Navigator.of(context).pushReplacementNamed(routeRe)
      //     : Navigator.of(context).pushReplacementNamed(routeFee);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.logoColor,
      backgroundColor: AppColors.black,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image(
          image: AssetImage(
            ImgAssets.logo,
          ),
        ),
      ),
    );
  }
}
