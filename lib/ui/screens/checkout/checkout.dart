import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/screens/checkout/payment_body.dart';
import 'package:dogventurehq/ui/screens/checkout/shipping_body.dart';
import 'package:dogventurehq/ui/screens/thankyou/thankyou.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  static String routeName = '/checkout';
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool showPaymentOptions = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              CustomTitle(title: 'Checkout'),
              addH(20.h),
              // Status
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/check_colored.svg',
                  ),
                  Container(
                    width: 150.w,
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    color: Colors.grey,
                  ),
                  SvgPicture.asset(
                    'assets/svgs/check.svg',
                  ),
                ],
              ),
              addH(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addW(40.w),
                  Text(
                    'Shipping',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: ConstantStrings.kFontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  addW(100.h),
                  Text(
                    'Review & Payment',
                    style: TextStyle(
                      fontFamily: ConstantStrings.kFontFamily,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              addH(20.h),
              showPaymentOptions ? const PaymentBody() : const ShippingBody(),
              const Spacer(),
              // Proceed button
              Center(
                child: CustomBtn(
                  onPressedFn: showPaymentOptions
                      ? () => Get.toNamed(ThankyouScreen.routeName)
                      : () => setState(() => showPaymentOptions = true),
                  btnTxt: showPaymentOptions ? 'Checkout' : 'Proceed',
                  btnSize: Size(255.w, 46.h),
                ),
              ),
              addH(35.h)
            ],
          ),
        ),
      ),
    );
  }
}
