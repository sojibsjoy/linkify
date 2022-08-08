import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onPressedFn;
  final String btnTxt;
  const CustomBtn({
    Key? key,
    required this.onPressedFn,
    required this.btnTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedFn,
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(255.w, 50.h),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(
          ConstantColors.k06C8FF,
        ),
      ),
      child: Text(
        btnTxt,
        style: TextStyle(
          fontSize: 15.sp,
          fontFamily: ConstantStrings.kFontFamily,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
