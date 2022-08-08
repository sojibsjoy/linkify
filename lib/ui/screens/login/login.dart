import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/custom_header.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/register/register.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool checkFlag = false;
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Login Header
          const CustomHeader(
            title: 'Hello Again!',
            subtitle: 'Welcome Back',
          ),
          // Email Field
          CustomField(
            textCon: emailCon,
            prefixIcon: 'assets/svgs/mail.svg',
            hintText: 'Email',
            inputType: TextInputType.emailAddress,
          ),
          addH(16.h),
          // Password Field
          CustomField(
            textCon: passwordCon,
            prefixIcon: 'assets/svgs/lock.svg',
            hintText: 'Password',
            isPassField: true,
          ),
          addH(16.h),
          // Forgot Password
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 160.w,
                  height: 22.h,
                  child: Row(
                    children: [
                      Checkbox(
                        value: checkFlag,
                        onChanged: (value) =>
                            setState(() => checkFlag = value!),
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
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: ConstantStrings.kFontFamily,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: forgot password
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: ConstantStrings.kFontFamily,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          addH(16.h),
          // Login Button
          CustomBtn(
            onPressedFn: () => Get.toNamed(HomeScreen.routeName),
            btnTxt: 'Log in',
          ),
          const Spacer(),
          // Sign Up Text
          RichText(
            text: TextSpan(
              text: 'Don\'t have an account? ',
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: ConstantStrings.kFontFamily,
                color: Colors.grey.shade600,
              ),
              children: [
                TextSpan(
                  text: 'Register',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(RegisterScreen.routeName),
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
          addH(35.h),
        ],
      ),
    );
  }
}
