import 'package:auto_size_text/auto_size_text.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildText extends StatelessWidget {
  final String text;
  Color? txtClr;
  int? maximumLines;
  BuildText({
    Key? key,
    required this.text,
    this.txtClr,
    this.maximumLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maximumLines,
      minFontSize: 10,
      textAlign: TextAlign.left,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        fontFamily: ConstantStrings.kFontFamily,
        color: txtClr,
      ),
    );
  }
}
