import 'package:flutter/material.dart';
import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class BodyView extends StatelessWidget {
  final String pageTitle;
  final String icon;
  final String txt;
  final Widget child;
  final VoidCallback btnFn;
  final String btnTxt;
  const BodyView({
    Key? key,
    required this.pageTitle,
    required this.icon,
    required this.txt,
    required this.child,
    required this.btnFn,
    required this.btnTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTitle(title: pageTitle),
        addH(52.h),
        // logo
        Container(
          height: 255.h,
          width: 255.w,
          decoration: BoxDecoration(
            color: ConstantColors.kD4EAFC,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              icon,
              fit: BoxFit.fill,
            ),
          ),
        ),
        addH(50.h),
        Text(
          txt,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: ConstantStrings.kFontFamily,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        addH(30.h),
        child,
        addH(40.h),
        // send custom btn
        CustomBtn(
          onPressedFn: btnFn,
          btnTxt: btnTxt,
          btnSize: Size(255.w, 45.h),
        ),
      ],
    );
  }
}
