import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/custom_header.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool checkFlag = false;
  final TextEditingController fNameCon = TextEditingController();
  final TextEditingController lNameCon = TextEditingController();
  final TextEditingController mobileNoCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController confirmPasswordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Register Header
          const CustomHeader(
            title: 'Hello!',
            subtitle: 'Signup to Get Started',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                // Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomField(
                      width: 187.w,
                      textCon: fNameCon,
                      prefixIcon: 'assets/svgs/account.svg',
                      hintText: 'First Name',
                    ),
                    CustomField(
                      width: 187.w,
                      textCon: fNameCon,
                      prefixIcon: 'assets/svgs/account.svg',
                      hintText: 'Last Name',
                    ),
                  ],
                ),
                addH(16.h),
                // Mobile No
                CustomField(
                  width: 387.w,
                  textCon: mobileNoCon,
                  prefixIcon: 'assets/svgs/phone.svg',
                  hintText: 'Mobile No',
                ),
                addH(16.h),
                // Email
                CustomField(
                  width: 387.w,
                  textCon: emailCon,
                  prefixIcon: 'assets/svgs/mail.svg',
                  hintText: 'Email',
                ),
                addH(16.h),
                // Password
                CustomField(
                  width: 387.w,
                  textCon: passwordCon,
                  prefixIcon: 'assets/svgs/lock.svg',
                  hintText: 'Password',
                  isPassField: true,
                ),
                addH(16.h),
                // Confirm Password
                CustomField(
                  width: 387.w,
                  textCon: confirmPasswordCon,
                  prefixIcon: 'assets/svgs/lock.svg',
                  hintText: 'Retype Password',
                  isPassField: true,
                ),
                addH(16.h),
                // Register Text
                Row(
                  children: [
                    Checkbox(
                      value: checkFlag,
                      onChanged: (value) => setState(() => checkFlag = value!),
                      splashRadius: 0,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: BorderSide(
                          color: Colors.grey.shade300,
                          width: 1,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 345.w,
                      child: RichText(
                        maxLines: 2,
                        text: TextSpan(
                          text: 'By signing up, you agree to our ',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: ConstantStrings.kFontFamily,
                            color: Colors.grey.shade600,
                          ),
                          children: [
                            TextSpan(
                              text: 'Privacy Policy',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => print('Privacy Policy'),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: ConstantStrings.kFontFamily,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: ConstantStrings.kFontFamily,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms & Conditions',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => print('Terms & Conditions'),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: ConstantStrings.kFontFamily,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                addH(16.h),
                CustomBtn(
                  onPressedFn: () {},
                  btnTxt: 'Register',
                ),
                addH(40.h),
                // Login Text
                RichText(
                  text: TextSpan(
                    text: 'Have an account? ',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kFontFamily,
                      color: Colors.grey.shade600,
                    ),
                    children: [
                      TextSpan(
                        text: 'Login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14.sp,
                          fontFamily: ConstantStrings.kFontFamily,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
