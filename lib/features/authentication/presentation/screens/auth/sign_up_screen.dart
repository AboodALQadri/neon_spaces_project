import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neon_spaces/config/routes/app_routes.dart';
import 'package:neon_spaces/core/utils/app_colors.dart';
import 'package:neon_spaces/core/utils/app_strings.dart';
import 'package:neon_spaces/core/utils/constants.dart';
import 'package:neon_spaces/core/utils/media_query_values.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/elevated_buttons/elevated_button.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/textField.dart';
import 'package:neon_spaces/features/authentication/presentation/widgets/text_utils.dart';
import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key, required this.isChecked}) : super(key: key);

  bool isChecked;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  XFile? image;
  final _formKey = GlobalKey<FormState>();

  bool agree = false;

  bool _visiblePassword = true;
  bool _visibleConfirmPassword = true;

  List<String> countryList = ['Palestine(Gaza)', 'Turkish(Istanbul)'];
  String dropDownValue = 'Palestine(Gaza)';

  void _doSomething() {
    // Do something

    if (_formKey.currentState!.validate()) {
      if (image != null) {
        Navigator.pushReplacementNamed(context, Routes.loginScreenRoute);
      } else if (image == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(AppStrings.pleaseAttachAPhoto),
          ),
        );
      }
    }

    print("Sign Up Success");
  }

  final TextEditingController _userNameTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _confirmPasswordTextController =
      TextEditingController();

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = XFile(image.path);

      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      debugPrint('${AppStrings.snackBarErrorMsg} $e');
    }
  }

  void chooseImagePickerButton() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey.shade400,
        action: SnackBarAction(
          textColor: AppColors.red,
          label: AppStrings.close,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
        content: SizedBox(
          width: double.infinity,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () => pickImage(
                  ImageSource.camera,
                ),
                child: const Text(
                  AppStrings.camera,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => pickImage(ImageSource.gallery),
                child: const Text(
                  AppStrings.gallery,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Placeholder(
      fallbackHeight: MediaQuery.of(context).size.height,
      fallbackWidth: MediaQuery.of(context).size.width,
      child: Constants.scaffoldComponent(
        appBarTitle: AppStrings.signUp,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: const Icon(Icons.arrow_back_ios_new),
        // ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(16),
            child: Column(
              children: [
                Padding(
                  // padding: const EdgeInsets.symmetric(horizontal: 88.0),
                  padding:  EdgeInsets.symmetric(horizontal: 10.h),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: context.height / 3,
                        child: InkWell(
                          onTap: () {
                            chooseImagePickerButton();
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColors.iconsBackground,
                            radius: 200.0,
                            child: image != null
                                ? ClipOval(
                                    child: Image.file(
                                      File(image!.path),
                                      width: 200.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                :  Icon(
                                    Icons.person_outline,
                                    size: 50.0.sp,
                                    color: Colors.black,
                                  ),
                          ),
                        ),
                      ),
                      Padding(
                        // padding: const EdgeInsets.only(top: 180.0),
                        padding:  EdgeInsets.only(top: 24.h),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.iconsBackground,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            width: 48.0,
                            height: 48.0,
                            child: IconButton(
                              onPressed: () {
                                chooseImagePickerButton();
                              },
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Container(
                      margin:  EdgeInsets.only(top: 3.0.h),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  textUtils(
                                    text: AppStrings.country,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp,
                                  ),
                                ],
                              ),
                              Container(
                                height: 56,
                                width: double.infinity,
                                padding: const EdgeInsetsDirectional.only(
                                    top: 14, bottom: 14, start: 10, end: 10),
                                margin: const EdgeInsetsDirectional.only(
                                    top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    // color: AppColors.container,
                                    border: Border.all(
                                      width: 0.25,
                                      color: AppColors.black,
                                    )),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textUtils(
                                      text: dropDownValue,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                    ),
                                    DropdownButton<String>(
                                      underline: const Text(''),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 30,
                                        color: AppColors.black,
                                      ),
                                      items: countryList.map((String items) {
                                        return DropdownMenuItem(
                                          value: items,
                                          child: textUtils(
                                            text: items,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                          ),
                                        );
                                      }).toList(),
                                      // items: widget.items.map((String items) {
                                      //   return DropdownMenuItem(
                                      //     value: items,
                                      //     child: textUtils(
                                      //       text: items,
                                      //       color: AppColors.black,
                                      //       fontWeight: FontWeight.w500,
                                      //       fontSize: 13,
                                      //     ),
                                      //   );
                                      // }).toList(),
                                      // onChanged: widget.onChange,
                                      // onChanged: (String? newValue) {},
                                      onChanged: (String? value) {
                                        setState(() {
                                          dropDownValue = value!;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          textFieldComponent(
                              controller: _userNameTextController,
                              keyboardType: TextInputType.text,
                              title: AppStrings.fullName,
                              hintText: AppStrings.userName,
                              icon: Icons.person_outline,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.fieldIsRequired;
                                }

                                return null;
                              }),
                           SizedBox(
                            height: 1.h,
                          ),
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
                            height: 1.h,
                          ),
                          textFieldComponent(
                              controller: _phoneTextController,
                              keyboardType: TextInputType.number,
                              title: AppStrings.phoneNumber,
                              hintText: AppStrings.phoneHintText,
                              icon: Icons.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.fieldIsRequired;
                                }
                                if (value.length < 14 || value.length > 14) {
                                  return AppStrings.phoneValidation;
                                }
                                return null;
                              }),
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
                            height: 1.h,
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
                                  _visibleConfirmPassword =
                                      !_visibleConfirmPassword;
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
                              }),
                          SizedBox(
                            height: 1.h,
                          ),
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
                                    value: widget.isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        // isChecked = value!;
                                        // widget.isChecked = value!;
                                        // agree = value ?? false;
                                        // widget.isChecked = value ?? false;
                                        widget.isChecked = value!;

                                        agree = widget.isChecked;
                                      });
                                    },
                                  ),
                                ),
                              ),
                               SizedBox(
                                width: 0.5.w,
                              ),
                              textUtils(
                                text: AppStrings.iAgreeWith,
                                color: AppColors.grey,
                                fontWeight: FontWeight.w300,
                                fontSize: 10.sp,
                              ),
                              TextButton(
                                child: textUtils(
                                  text: AppStrings.termsAndPrivacy,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10.sp,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    Routes.termsAndConditionsScreenRoute,
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          elevatedButton(
                            onPress:
                                widget.isChecked || agree ? _doSomething : null,
                            title: AppStrings.signUp,
                            titleColor: AppColors.white,
                            backgroundColor: AppColors.primaryColor,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textUtils(
                                text: AppStrings.alreadyHaveAnAccount,
                                color: AppColors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                              ),
                              TextButton(
                                child: textUtils(
                                  text: AppStrings.login,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.sp,
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.loginScreenRoute);
                                },
                              ),
                            ],
                          )
                        ],
                      ),
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
