import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/auth.dart';
import 'package:dogventurehq/states/models/register.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/custom_header.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/register';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authCon = Get.find<AuthController>();
  bool checkFlag = false;
  bool _isRegistering = false;
  final TextEditingController fNameCon = TextEditingController();
  final TextEditingController lNameCon = TextEditingController();
  final TextEditingController mobileNoCon = TextEditingController();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController confirmPasswordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        textCon: lNameCon,
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
                    inputType: TextInputType.number,
                  ),
                  addH(16.h),
                  // Email
                  CustomField(
                    width: 387.w,
                    textCon: emailCon,
                    prefixIcon: 'assets/svgs/mail.svg',
                    hintText: 'Email',
                    inputType: TextInputType.emailAddress,
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
                      SizedBox(
                        width: 340.w,
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
                    onPressedFn: () {
                      if (!checkFlag) {
                        Methods.showSnackbar(
                          msg: 'Please agree to our terms & conditions',
                        );
                        return;
                      }
                      if (fNameCon.text.isEmpty ||
                          lNameCon.text.isEmpty ||
                          mobileNoCon.text.isEmpty ||
                          emailCon.text.isEmpty ||
                          passwordCon.text.isEmpty ||
                          confirmPasswordCon.text.isEmpty) {
                        Methods.showSnackbar(
                          msg: 'Please fill all fields',
                        );
                        return;
                      }

                      if (passwordCon.text.length < 6 ||
                          confirmPasswordCon.text.length < 6) {
                        Methods.showSnackbar(
                          msg: 'Password must be at least 6 characters',
                        );
                        return;
                      }
                      if (passwordCon.text != confirmPasswordCon.text) {
                        Methods.showSnackbar(
                          msg: 'Passwords do not match',
                        );
                        return;
                      }
                      RegisterModel registerModel = RegisterModel(
                        customerId: 0,
                        userName: emailCon.text,
                        firstName: fNameCon.text,
                        lastName: lNameCon.text,
                        phoneNo: mobileNoCon.text,
                        email: emailCon.text,
                        password: passwordCon.text,
                        firstLastName: '${fNameCon.text} ${lNameCon.text}',
                      );
                      _authCon.register(registerModel);
                      setState(() => _isRegistering = true);
                      Get.defaultDialog(
                        title: 'Registering...',
                        content: Obx(
                          () {
                            if (_authCon.isRegistering.value) {
                              return SizedBox(
                                height: 100.h,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else {
                              _isRegistering = false;
                              if (_authCon.isRegistered.value) {
                                return const Center(
                                  child: Text('Registered Successfully'),
                                );
                              } else {
                                return const Center(
                                  child: Text('Something went wrong'),
                                );
                              }
                            }
                          },
                        ),
                      );
                    },
                    btnTxt: _isRegistering ? 'Processing...' : 'Register',
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
      ),
    );
  }
}
