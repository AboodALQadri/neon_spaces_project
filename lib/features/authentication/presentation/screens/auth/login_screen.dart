import 'package:flutter/material.dart';
import 'package:neon_spaces/config/routes/app_routes.dart';
import 'package:neon_spaces/core/utils/app_colors.dart';
import 'package:neon_spaces/core/utils/app_strings.dart';
import 'package:neon_spaces/core/utils/assets_manager.dart';
import 'package:neon_spaces/core/utils/constants.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/elevated_buttons/elevated_button.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/textField.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/text_field_widget.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/text_utils.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool _isChecked = false;

  final _formKey = GlobalKey<FormState>();

  bool _visiblePassword = true;

  bool initialValue = false;
  bool autovalidate = false;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: MediaQuery.of(context).size.height,
      fallbackWidth: MediaQuery.of(context).size.width,
      child: Constants.scaffoldComponent(
        appBarTitle: AppStrings.login,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: 163,
                    width: 178,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image(
                      image: AssetImage(
                        ImgAssets.logo,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      textUtils(
                        text: AppStrings.welcomeBack,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  textFieldComponent(
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      title: AppStrings.emailAddress,
                      hintText: AppStrings.emailHintText,
                      icon: Icons.email_outlined,
                      validator: (value) {}),
                  SizedBox(
                    height: 1.h,
                  ),
                  textFieldComponent(
                    controller: _passwordTextController,
                    keyboardType: TextInputType.visiblePassword,
                    title: AppStrings.password,
                    hintText: AppStrings.passwordHintText,
                    icon: _visiblePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    onPressedIcon: () {
                      setState(() {
                        _visiblePassword = !_visiblePassword;
                      });
                    },
                    isPassword: _visiblePassword,
                    validator: (value) {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor:
                                    AppColors.grey, // Your color
                              ),
                              child: Checkbox(
                                activeColor: AppColors.primaryColor,
                                value: _isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 0.5.w,
                          ),
                          textUtils(
                            text: AppStrings.rememberMe,
                            color: AppColors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                          ),
                        ],
                      ),
                      TextButton(
                        child: textUtils(
                          text: AppStrings.forgetPassword,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            Routes.forgetPasswordScreenRoute,
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  elevatedButton(
                    title: AppStrings.signIn,
                    titleColor: AppColors.white,
                    backgroundColor: AppColors.primaryColor,
                    onPress: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textUtils(
                        text: AppStrings.doNotHaveAnAccount,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp,
                      ),
                      TextButton(
                        child: textUtils(
                          text: AppStrings.signUp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.signUpScreenRoute);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
