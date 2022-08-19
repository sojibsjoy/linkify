import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_img.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryIcon extends StatelessWidget {
  final int indexValue;
  final VoidCallback onTapFn;
  final String categoryName;
  final String categoryImage;
  double? totalWidth;
  double? txtSize;
  FontWeight? txtWeight;
  CategoryIcon({
    Key? key,
    required this.indexValue,
    required this.onTapFn,
    required this.categoryName,
    required this.categoryImage,
    this.totalWidth,
    this.txtSize,
    this.txtWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFn,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
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
                CustomImg(
                  imgUrl: categoryImage,
                  imgFit: BoxFit.contain,
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
                fontSize: txtSize ?? 12.sp,
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
