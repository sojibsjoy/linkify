import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomItem extends StatelessWidget {
  final VoidCallback onTapFn;
  final Widget child;
  const CustomItem({
    Key? key,
    required this.onTapFn,
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
              image: const DecorationImage(
                image: AssetImage('assets/images/watch.png'),
                fit: BoxFit.fill,
              ),
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
                'Crown Summit Backpack',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: ConstantStrings.kFontFamily,
                  fontWeight: FontWeight.w600,
                ),
              ),
              // Price
              Text(
                'Price: AED99.00',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
              child,
            ],
          ),
          // Delete
          InkWell(
            onTap: () => onTapFn,
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
