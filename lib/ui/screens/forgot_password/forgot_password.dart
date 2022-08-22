import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/forgot_password/body_view.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String routeName = '/forgot_password';
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  final TextEditingController _confirmPassCon = TextEditingController();
  final bool _isSent = false;
  final bool _isVarified = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: !_isSent
              ? !_isVarified
                  ? getThirdView()
                  : getSecondView()
              : getFirstView(),
        ),
      ),
    );
  }

  Widget getFirstView() {
    return BodyView(
      pageTitle: 'Forgot Password',
      icon: 'assets/svgs/lock_color.svg',
      txt: 'Please Enter Your Email Address To\nRecieve a Verification Code',
      btnFn: () => print(_emailCon.text),
      btnTxt: 'Send',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          addH(40.h),
          fieldTitle('Email Address'),
          addH(10.h),
          CustomField(
            textCon: _emailCon,
            hintText: 'test@royex.net',
          ),
        ],
      ),
    );
  }

  Widget getSecondView() {
    return BodyView(
      pageTitle: 'Verify Your Email',
      icon: 'assets/svgs/email.svg',
      txt: 'Please Enter The 4 Digit Code Sent To\n${_emailCon.text}',
      btnFn: () => print("otpCode"),
      btnTxt: 'Verify',
      child: Column(
        children: [
          SizedBox(
            width: 260.w,
            height: 65.h,
            child: PinCodeTextField(
              appContext: context,
              length: 4,
              textStyle: TextStyle(
                fontSize: 40.sp,
                fontFamily: ConstantStrings.kFontFamily,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.underline,
                fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5.w),
                fieldHeight: 60.h,
                fieldWidth: 55.w,
                selectedColor: ConstantColors.k06C8FF,
                inactiveColor: ConstantColors.k06C8FF,
                activeColor: ConstantColors.k06C8FF,
                borderWidth: 2.w,
              ),
              onChanged: (value) {},
            ),
          ),
          addH(10.h),
          InkWell(
            onTap: () {
              // TODO: re-send otp code request to server
            },
            child: Text(
              'Resend Code',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
                fontFamily: ConstantStrings.kFontFamily,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getThirdView() {
    return BodyView(
      pageTitle: 'Create New Password',
      icon: 'assets/svgs/unlock.svg',
      txt: 'You Password Must be Different\nfrom Previously Used Password',
      btnFn: () => print("new password"),
      btnTxt: 'Save',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          fieldTitle('New Password'),
          addH(10.h),
          CustomField(
            textCon: _passCon,
            hintText: 'Enter New Password',
            isPassField: true,
          ),
          addH(20.h),
          fieldTitle('New Password'),
          addH(10.h),
          CustomField(
            textCon: _passCon,
            hintText: 'Enter New Password',
            isPassField: true,
          ),
        ],
      ),
    );
  }

  Widget fieldTitle(String txt) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade700,
        fontFamily: ConstantStrings.kFontFamily,
      ),
    );
  }
}
