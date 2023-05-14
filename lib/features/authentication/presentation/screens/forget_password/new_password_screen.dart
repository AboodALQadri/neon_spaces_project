import 'package:flutter/material.dart';
import 'package:neon_spaces/config/routes/app_routes.dart';
import 'package:neon_spaces/core/utils/app_colors.dart';
import 'package:neon_spaces/core/utils/app_strings.dart';
import 'package:neon_spaces/core/utils/assets_manager.dart';
import 'package:neon_spaces/core/utils/constants.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/elevated_buttons/elevated_button_for_widget.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/textField.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/text_utils.dart';
import 'package:sizer/sizer.dart';

class NewPasswordScreen extends StatefulWidget {
  NewPasswordScreen({Key? key}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController _passwordTextController = TextEditingController();

  final TextEditingController _confirmPasswordTextController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool _visiblePassword = true;
  bool _visibleConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: MediaQuery.of(context).size.height,
      fallbackWidth: MediaQuery.of(context).size.width,
      child: Constants.scaffoldComponent(
        appBarTitle: AppStrings.newPassword,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 150,
                      width: 150,
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
                      height: 2.h,
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppStrings.fieldIsRequired;
                            }
                            if (value.length < 8) {
                              return AppStrings.passwordValidation;
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 2.h,
                      ),
                      textFieldComponent(
                        controller: _confirmPasswordTextController,
                        keyboardType: TextInputType.visiblePassword,
                        title: AppStrings.confirmPassword,
                        hintText: AppStrings.confirmPasswordHintText,
                        icon: _visibleConfirmPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        onPressedIcon: () {
                          setState(() {
                            _visibleConfirmPassword = !_visibleConfirmPassword;
                          });
                        },
                        isPassword: _visibleConfirmPassword,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppStrings.fieldIsRequired;
                          }
                          if (value != _passwordTextController.text) {
                            return AppStrings.passwordIsNotSame;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      elevatedButtonForWidget(
                        child: textUtils(
                          text: AppStrings.changePassword,
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Processing Success')),
                            );
                            Navigator.of(context).pushNamedAndRemoveUntil(
                              Routes.loginScreenRoute,
                              (route) => false,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
