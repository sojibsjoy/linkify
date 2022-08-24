import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  final String prefixTxt;
  final String suffixTxt;
  const RowItem({
    Key? key,
    required this.prefixTxt,
    required this.suffixTxt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              prefixTxt,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
                fontFamily: ConstantStrings.kFontFamily,
              ),
            ),
            Text(
              suffixTxt,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: ConstantStrings.kFontFamily,
              ),
            ),
          ],
        ),
        addH(5.h),
        Divider(
          color: Colors.grey.shade200,
          thickness: 1,
        ),
        addH(5.h),
      ],
    );
  }
}
