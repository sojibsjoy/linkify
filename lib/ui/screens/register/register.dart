import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/auth.dart';
import 'package:dogventurehq/states/models/user.dart';
import 'package:dogventurehq/states/utils/methods.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/custom_header.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
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
  final TextEditingController _fNameCon = TextEditingController();
  final TextEditingController _lNameCon = TextEditingController();
  final TextEditingController _mobileNoCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();
  final TextEditingController _confirmPasswordCon = TextEditingController();
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
                        textCon: _fNameCon,
                        prefixIcon: 'assets/svgs/account.svg',
                        hintText: 'First Name',
                      ),
                      CustomField(
                        width: 187.w,
                        textCon: _lNameCon,
                        prefixIcon: 'assets/svgs/account.svg',
                        hintText: 'Last Name',
                      ),
                    ],
                  ),
                  addH(16.h),
                  // Mobile No
                  CustomField(
                    width: 387.w,
                    textCon: _mobileNoCon,
                    prefixIcon: 'assets/svgs/phone.svg',
                    hintText: 'Mobile No',
                    inputType: TextInputType.number,
                  ),
                  addH(16.h),
                  // Email
                  CustomField(
                    width: 387.w,
                    textCon: _emailCon,
                    prefixIcon: 'assets/svgs/mail.svg',
                    hintText: 'Email',
                    inputType: TextInputType.emailAddress,
                  ),
                  addH(16.h),
                  // Password
                  CustomField(
                    width: 387.w,
                    textCon: _passwordCon,
                    prefixIcon: 'assets/svgs/lock.svg',
                    hintText: 'Password',
                    isPassField: true,
                  ),
                  addH(16.h),
                  // Confirm Password
                  CustomField(
                    width: 387.w,
                    textCon: _confirmPasswordCon,
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
                      if (_fNameCon.text.isEmpty ||
                          _lNameCon.text.isEmpty ||
                          _mobileNoCon.text.isEmpty ||
                          _emailCon.text.isEmpty ||
                          _passwordCon.text.isEmpty ||
                          _confirmPasswordCon.text.isEmpty) {
                        Methods.showSnackbar(
                          msg: ConstantStrings.kEmptyFields,
                        );
                        return;
                      }
                      if (!_emailCon.text.isEmail) {
                        Methods.showSnackbar(msg: ConstantStrings.kValidEmail);
                        return;
                      }
                      if (_passwordCon.text.length < 6 ||
                          _confirmPasswordCon.text.length < 6) {
                        Methods.showSnackbar(
                          msg: ConstantStrings.kPasswordLength,
                        );
                        return;
                      }
                      if (_passwordCon.text != _confirmPasswordCon.text) {
                        Methods.showSnackbar(
                          msg: 'Passwords do not match',
                        );
                        return;
                      }
                      UserModel registerModel = UserModel(
                        customerId: 0,
                        userName: _emailCon.text,
                        firstName: _fNameCon.text,
                        lastName: _lNameCon.text,
                        phoneNo: _mobileNoCon.text,
                        email: _emailCon.text,
                        password: _passwordCon.text,
                        firstLastName: '',
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
                              Future.delayed(
                                const Duration(seconds: 1),
                                () => setState(() => _isRegistering = false),
                              );
                              if (_authCon.isRegistered.value) {
                                Future.delayed(
                                  const Duration(seconds: 2),
                                  () => Get.toNamed(HomeScreen.routeName),
                                );
                                return const Center(
                                  child: Text('Registered Successfully'),
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
