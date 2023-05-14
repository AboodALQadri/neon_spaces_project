import 'package:flutter/material.dart';
import 'package:neon_spaces/config/routes/app_routes.dart';
import 'package:neon_spaces/core/utils/app_colors.dart';
import 'package:neon_spaces/core/utils/app_strings.dart';
import 'package:neon_spaces/core/utils/assets_manager.dart';
import 'package:neon_spaces/core/utils/constants.dart';
import 'package:neon_spaces/features/authentication/presentation/screens/auth/sign_up_screen.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/elevated_buttons/small_elevated_button_widget.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/text_utils.dart';
import 'package:sizer/sizer.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  TermsAndConditionsScreen({Key? key}) : super(key: key);
  bool isChecked = false;

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: MediaQuery.of(context).size.height,
      fallbackWidth: MediaQuery.of(context).size.width,
      child: Constants.scaffoldComponent(
        appBarTitle: AppStrings.termsAndPrivacy,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: const Icon(Icons.arrow_back_ios_new),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(
                  height: 4,
                ),
                Container(
                  height: 20.h,
                  width: 20.h,
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
                  text:
                      'Lorem ipsum dolor sit amet consectetur. Eu suspendisse mattis suspendisse.',
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
                 SizedBox(
                  height: 1.h,
                ),
                textUtils(
                  text:
                      'Lorem ipsum dolor sit amet consectetur. Pellentesque in nisl viverra feugiat quam senectus gravida mauris tincidunt. Vestibulum sociis turpis scelerisque nulla accumsan morbi aliquam sit diam. Molestie tortor in molestie risus. ',
                  color: AppColors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 10.sp,
                  height: 2,
                ),
                SizedBox(
                  height: 1.h,
                ),
                textUtils(
                  text:
                      "Lorem ipsum dolor sit amet consectetur. Pellentesque in nisl viverra feugiat quam senectus gravida mauris tincidunt. Vestibulum sociis turpis scelerisque nulla accumsan morbi aliquam sit diam. Molestie tortor in molestie risus. Dui pellentesque dignissim sed enim duis malesuada. Pretium cras integer urna ipsum. Sem arcu faucibus at fermentum.",
                  color: AppColors.grey,
                  fontWeight: FontWeight.w300,
                  fontSize: 10.sp,
                  height: 2,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    smallElevatedButtonWidget(
                      title: AppStrings.decline,
                      titleColor: AppColors.black,
                      backgroundColor: AppColors.container,
                      onPress: () {
                        setState(() {
                          isChecked = false;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SignUpScreen(isChecked: isChecked),
                            ));
                      },
                    ),
                    smallElevatedButtonWidget(
                      title: AppStrings.accept,
                      titleColor: AppColors.white,
                      backgroundColor: AppColors.primaryColor,
                      onPress: () {
                        setState(() {
                          isChecked = true;
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  SignUpScreen(isChecked: isChecked),
                            ));
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
