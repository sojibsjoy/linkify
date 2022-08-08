import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  const CustomHeader({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header
        SizedBox(
          height: 304.h,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 304.h,
                child: Image.asset(
                  'assets/images/header_bg.png',
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 304.h,
                child: Image.asset(
                  'assets/images/header_mask.png',
                  fit: BoxFit.fill,
                ),
              ),
              // logo
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: 202.w,
                  height: 32.h,
                ),
              )
            ],
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: ConstantStrings.kFontFamily,
            color: Colors.black,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 24.sp,
            fontFamily: ConstantStrings.kFontFamily,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        addH(6.h),
      ],
    );
  }
}
