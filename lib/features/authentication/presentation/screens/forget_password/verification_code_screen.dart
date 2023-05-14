import 'package:flutter/material.dart';
import 'package:neon_spaces/config/routes/app_routes.dart';
import 'package:neon_spaces/core/utils/app_colors.dart';
import 'package:neon_spaces/core/utils/app_strings.dart';
import 'package:neon_spaces/core/utils/assets_manager.dart';
import 'package:neon_spaces/core/utils/constants.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/elevated_buttons/elevated_button_for_widget.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/text_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({Key? key}) : super(key: key);

  final TextEditingController _pinCodeTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Widget _buildPinCodeFields(BuildContext context) {
    return PinCodeTextField(
      controller: _pinCodeTextController,
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppStrings.fieldIsRequired;
        }
        if (!RegExp(Constants.validationPinCode).hasMatch(value)) {
          return AppStrings.codeIsNotValid;
        } else {
          return null;
        }
      },
      appContext: context,
      autoFocus: true,
      cursorColor: AppColors.primaryColor,
      keyboardType: TextInputType.number,
      length: 6,
      obscureText: false,
      animationType: AnimationType.scale,
      textStyle: TextStyle(color: AppColors.primaryColor),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(12),
        fieldHeight: 48,
        fieldWidth: 48,
        borderWidth: 1,
        activeColor: AppColors.primaryColor,
        inactiveColor: AppColors.grey,
        inactiveFillColor: Colors.white,
        activeFillColor: Colors.white,
        selectedColor: AppColors.primaryColor,
        selectedFillColor: Colors.white,
        errorBorderColor: AppColors.red,
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: Colors.white,
      enableActiveFill: true,
      onCompleted: (submittedCode) {
        // otpCode = submittedCode;
        debugPrint("Completed");
      },
      onChanged: (value) {
        debugPrint(value);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: MediaQuery.of(context).size.height,
      fallbackWidth: MediaQuery.of(context).size.width,
      child: Constants.scaffoldComponent(
        appBarTitle: AppStrings.verificationCode,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
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
                    height: 3.h,
                  ),
                  textUtils(
                    text: AppStrings.weSentYouACode,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: textUtils(
                      text:
                          "Lorem ipsum dolor sit amet consectetur. Volutpat pretium nisl amet sit volutpat eu.",
                      color: AppColors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 10.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textUtils(
                        text: AppStrings.enterVerificationCode,
                        color: AppColors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                      textUtils(
                        text: "00:59s",
                        color: AppColors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),

                  _buildPinCodeFields(context),
                  // _buildResendCodeButton(state),
                  SizedBox(
                    height: 5.h,
                  ),
                  elevatedButtonForWidget(
                    child: textUtils(
                      text: AppStrings.confirmCode,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(
                            context, Routes.newPasswordScreenRoute);
                      }
                    },
                  ),

                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textUtils(
                        text: AppStrings.doNotReceiveCode,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 11.sp,
                      ),
                      TextButton(
                        child: textUtils(
                          text: AppStrings.reSend,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                        onPressed: () {},
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
