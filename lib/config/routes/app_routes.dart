import 'package:flutter/material.dart';
import 'package:neon_spaces/core/utils/app_strings.dart';
import 'package:neon_spaces/features/authentication/presentation/screens/auth/login_screen.dart';
import 'package:neon_spaces/features/authentication/presentation/screens/auth/sign_up_screen.dart';
import 'package:neon_spaces/features/authentication/presentation/screens/auth/terms_and_conditions_screen.dart';
import 'package:neon_spaces/features/authentication/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:neon_spaces/features/authentication/presentation/screens/forget_password/new_password_screen.dart';
import 'package:neon_spaces/features/authentication/presentation/screens/forget_password/verification_code_screen.dart';
import 'package:neon_spaces/features/authentication/presentation/screens/splash_screen.dart';

// import 'package:neon_spaces/injection_container.dart' as di;

class Routes {
  static const String initialRoute = '/';
  static const String loginScreenRoute = '/LoginScreen';
  static const String signUpScreenRoute = '/signUpScreen';
  static const String termsAndConditionsScreenRoute =
      '/termsAndConditionsScreen';
  static const String forgetPasswordScreenRoute = '/forgetPasswordScreen';
  static const String verificationCodeScreenRoute = '/verificationCodeScreen';
  static const String newPasswordScreenRoute = '/newPasswordScreen';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: ((context) => LoginScreen()),
        );

      case Routes.loginScreenRoute:
        return MaterialPageRoute(
          builder: ((context) => LoginScreen()),
        );
      case Routes.signUpScreenRoute:
        // bool? isChecked;
        bool isChecked = false;
        return MaterialPageRoute(
          builder: ((context) => SignUpScreen(
                isChecked: isChecked,
              )),
        );
      case Routes.termsAndConditionsScreenRoute:
        return MaterialPageRoute(
          builder: ((context) => TermsAndConditionsScreen()),
        );

      case Routes.forgetPasswordScreenRoute:
        return MaterialPageRoute(
          builder: ((context) => ForgetPasswordScreen()),
        );
      case Routes.verificationCodeScreenRoute:
        return MaterialPageRoute(
          builder: ((context) => VerificationCodeScreen()),
        );
      case Routes.newPasswordScreenRoute:
        return MaterialPageRoute(
          builder: ((context) => NewPasswordScreen()),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((context) => const Scaffold(
            body: Center(
              child: Text(AppStrings.noRoute),
            ),
          )),
    );
  }
}
