import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/screens/home/home.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ThankyouScreen extends StatelessWidget {
  static String routeName = '/thankyou';
  const ThankyouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String invoiceNo = Get.arguments ?? '';
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/svgs/check.svg',
                color: Colors.green,
                height: 80.h,
                width: 80.w,
              ),
              Text(
                'Thank\nYou',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 65.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: ConstantStrings.kFontFamily,
                ),
              ),
              addH(40.h),
              // invoice number
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Invoice Number:',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kFontFamily,
                    ),
                  ),
                  addW(5.w),
                  Text(
                    invoiceNo,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: ConstantStrings.kFontFamily,
                    ),
                  ),
                ],
              ),
              addH(40.h),
              // track your order custom btn & continue shopping custom btn
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomBtn(
                    onPressedFn: () {},
                    btnTxt: 'Track Your Order',
                    btnSize: Size(185.w, 45.h),
                    btnColor: Colors.white,
                    txtColor: Colors.black,
                    txtWeight: FontWeight.normal,
                  ),
                  CustomBtn(
                    onPressedFn: () => Get.offAllNamed(HomeScreen.routeName),
                    btnTxt: 'Continue Shopping',
                    btnSize: Size(185.w, 45.h),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
