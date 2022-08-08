import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildText extends StatelessWidget {
  final String text;
  Color? txtClr;
  BuildText({
    Key? key,
    required this.text,
    this.txtClr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: ConstantStrings.kFontFamily,
        color: txtClr,
      ),
    );
  }
}
