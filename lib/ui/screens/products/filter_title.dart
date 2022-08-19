import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class FilterTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTapFn;
  String? suffixTxt;
  IconData? suffixIcon;
  double? suffixIconSize;
  FilterTitle({
    Key? key,
    required this.title,
    required this.onTapFn,
    this.suffixTxt,
    this.suffixIcon,
    this.suffixIconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontFamily: ConstantStrings.kFontFamily,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        // view all btn
        InkWell(
          onTap: onTapFn,
          child: SizedBox(
            width: 150.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // view all
                Text(
                  suffixTxt ?? 'View All',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: ConstantStrings.kFontFamily,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                  ),
                ),
                // forward arrow
                Icon(
                  suffixIcon ?? Icons.arrow_forward_ios,
                  size: suffixIconSize ?? 15,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
