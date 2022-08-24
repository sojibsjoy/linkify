import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_img.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomItem extends StatelessWidget {
  final String imgLink;
  final String productName;
  final double price;
  final VoidCallback deleteIconFn;
  final Widget child;
  const CustomItem({
    Key? key,
    required this.deleteIconFn,
    required this.imgLink,
    required this.productName,
    required this.price,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 388.w,
      height: 120.h,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        border: Border.all(
          color: ConstantColors.kF3F3F3,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: CustomImg(
              imgUrl: imgLink,
              imgFit: BoxFit.fill,
            ),
          ),
          addW(10.h),
          // Details
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Title
              Text(
                productName,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: ConstantStrings.kFontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Price
              Text(
                'Price: AED$price',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
              child,
            ],
          ),
          const Spacer(),
          // Delete
          InkWell(
            onTap: deleteIconFn,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              width: 20.w,
              height: 20.h,
              margin: EdgeInsets.only(right: 10.w, top: 15.h),
              child: Center(
                child: SvgPicture.asset(
                  'assets/svgs/delete.svg',
                  color: ConstantColors.k06C8FF,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
