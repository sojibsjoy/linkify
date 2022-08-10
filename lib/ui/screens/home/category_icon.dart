import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryIcon extends StatelessWidget {
  final int indexValue;
  final VoidCallback onTapFn;
  final String categoryName;
  double? totalWidth;
  double? txtSize;
  FontWeight? txtWeight;
  CategoryIcon({
    Key? key,
    required this.indexValue,
    required this.onTapFn,
    required this.categoryName,
    this.totalWidth,
    this.txtSize,
    this.txtWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFn,
      child: Column(
        children: [
          SizedBox(
            width: totalWidth ?? 80.w,
            height: 60.h,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SvgPicture.asset(
                  'assets/svgs/category_bg.svg',
                  color: indexValue % 2 != 0 ? ConstantColors.kDED4FC : null,
                ),
                Image.asset(
                  indexValue % 2 != 0
                      ? 'assets/images/beauty.png'
                      : 'assets/images/gadget.png',
                ),
              ],
            ),
          ),
          SizedBox(
            width: totalWidth ?? 80.w,
            height: 40.h,
            child: Text(
              categoryName,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: txtSize ?? 14.sp,
                fontFamily: ConstantStrings.kFontFamily,
                fontWeight: txtWeight ?? FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
