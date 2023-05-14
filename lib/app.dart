import "package:flutter/material.dart";
import 'package:neon_spaces/config/routes/app_routes.dart';
import 'package:neon_spaces/core/utils/app_strings.dart';
import 'package:sizer/sizer.dart';
import 'config/themes/app_theme.dart';

class NeonSpace extends StatelessWidget {
  const NeonSpace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          theme: appTheme(),
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
