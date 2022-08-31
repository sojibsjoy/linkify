import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/auth.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/custom_header.dart';
import 'package:dogventurehq/ui/screens/forgot_password/forgot_password.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/screens/register/register.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authCon = Get.find<AuthController>();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  bool _rememberMe = false;
  bool _loggingIn = false;

  @override
  void initState() {
    if (Preference.getRememberMeFlag()) {
      _emailCon.text = Preference.getLoginEmail();
      _passwordCon.text = Preference.getLoginPass();
      _rememberMe = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Login Header
            const CustomHeader(
              title: 'Hello Again!',
              subtitle: 'Welcome Back',
            ),
            // Email Field
            CustomField(
              textCon: _emailCon,
              prefixIcon: 'assets/svgs/mail.svg',
              hintText: 'Email',
              inputType: TextInputType.emailAddress,
            ),
            addH(16.h),
            // Password Field
            CustomField(
              textCon: _passwordCon,
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
                    width: 165.w,
                    height: 22.h,
                    child: Row(
                      children: [
                        Checkbox(
                          value: _rememberMe,
                          onChanged: (value) =>
                              setState(() => _rememberMe = value!),
                          splashRadius: 0,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
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
                    onPressed: () => Get.toNamed(
                      ForgotPasswordScreen.routeName,
                    ),
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
              onPressedFn: () {
                if (_emailCon.text.isEmpty || _passwordCon.text.isEmpty) {
                  Methods.showSnackbar(msg: ConstantStrings.kEmptyFields);
                  return;
                }
                if (!_emailCon.text.isEmail) {
                  Methods.showSnackbar(
                    msg: ConstantStrings.kValidEmail,
                  );
                  return;
                }
                if (_passwordCon.text.length < 6) {
                  Methods.showSnackbar(
                    msg: ConstantStrings.kPasswordLength,
                  );
                  return;
                }
                if (_rememberMe) {
                  Preference.setRememberMeFlag(true);
                  Preference.setLoginEmail(_emailCon.text);
                  Preference.setLoginPass(_passwordCon.text);
                } else {
                  Preference.setRememberMeFlag(false);
                }
                setState(() => _loggingIn = true);
                _authCon.login(
                  email: _emailCon.text,
                  password: _passwordCon.text,
                  rememberMe: _rememberMe,
                );
                Get.defaultDialog(
                  title: 'Logging in...',
                  content: Obx(
                    () {
                      if (_authCon.isLoggingIn.value) {
                        return SizedBox(
                          height: 100.h,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      } else {
                        Future.delayed(
                          const Duration(seconds: 1),
                          () => setState(() => _loggingIn = false),
                        );
                        if (_authCon.isLoggedIn.value) {
                          Future.delayed(
                            const Duration(seconds: 2),
                            () => Get.toNamed(HomeScreen.routeName),
                          );
                          return const Center(
                            child: Text('Login Successfully'),
                          );
                        } else {
                          return Center(
                            child: Text(ConstantStrings.kWentWrong),
                          );
                        }
                      }
                    },
                  ),
                );
              },
              btnTxt: _loggingIn ? 'Processing...' : 'Log in',
            ),
            addH(220.h),
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
      ),
    );
  }
}
