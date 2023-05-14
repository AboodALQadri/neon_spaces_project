import 'package:flutter/material.dart';
import 'package:neon_spaces/config/routes/app_routes.dart';
import 'package:neon_spaces/core/utils/app_colors.dart';
import 'package:neon_spaces/core/utils/app_strings.dart';
import 'package:neon_spaces/core/utils/assets_manager.dart';
import 'package:neon_spaces/core/utils/constants.dart';
import 'package:neon_spaces/core/utils/media_query_values.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/elevated_buttons/elevated_button_for_widget.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/textField.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/text_utils.dart';
import 'package:sizer/sizer.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: MediaQuery.of(context).size.height,
      fallbackWidth: MediaQuery.of(context).size.width,
      child: Constants.scaffoldComponent(
        appBarTitle: AppStrings.forgetPassword1,
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
                    Row(
                      children: [
                        textUtils(
                          text: AppStrings.resetYourPassword,
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    textUtils(
                      text:
                          "Lorem ipsum dolor sit amet consectetur. Pellentesque in nisl viverra Pan****@gmail.com",
                      color: AppColors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 10.sp,
                    ),
                  ],
                ),
                SizedBox(
                  height: 3.h,
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
                  height: 3.h,
                ),
                SizedBox(
                  height: context.height / 3,
                  width: double.infinity,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        textFieldComponent(
                            controller: _emailTextController,
                            keyboardType: TextInputType.emailAddress,
                            title: AppStrings.emailAddress,
                            hintText: AppStrings.emailHintText,
                            icon: Icons.email_outlined,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return AppStrings.fieldIsRequired;
                              }
                              if (!RegExp(Constants.validationEmail)
                                  .hasMatch(value)) {
                                return AppStrings.emailIsNotValid;
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(
                          height: 7.h,
                        ),
                        elevatedButtonForWidget(
                          child: textUtils(
                            text: AppStrings.sendCode,
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.sp,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(
                                  context, Routes.verificationCodeScreenRoute);
                            }
                          },
                        ),
                      ],
                    ),
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
