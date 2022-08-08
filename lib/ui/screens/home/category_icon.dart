import 'package:dogventurehq/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CategoryIcon extends StatelessWidget {
  final VoidCallback onTapFn;
  final String categoryName;
  final String imgUrl;
  Color? bgClr;
  CategoryIcon({
    Key? key,
    required this.onTapFn,
    required this.categoryName,
    required this.imgUrl,
    this.bgClr,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 80.w,
          height: 60.h,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SvgPicture.asset(
                'assets/svgs/category_bg.svg',
                color: bgClr,
              ),
              Image.asset(
                imgUrl,
              ),
            ],
          ),
        ),
        SizedBox(
          width: 80.w,
          height: 40.h,
          child: Text(
            categoryName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: ConstantStrings.kFontFamily,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
