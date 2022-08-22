import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  String? suffixIcon;
  VoidCallback? suffixOnTapFn;
  CustomTitle({
    Key? key,
    required this.title,
    this.suffixIcon,
    this.suffixOnTapFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        addH(65.h),
        // Title
        Row(
          children: [
            InkWell(
              onTap: () => Get.back(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SizedBox(
                width: 28.w,
                height: 28.h,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/svgs/back.svg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: ConstantStrings.kFontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (suffixIcon != null) const Spacer(),
            if (suffixIcon != null)
              InkWell(
                onTap: suffixOnTapFn,
                child: SizedBox(
                  width: 28.w,
                  height: 28.h,
                  child: Center(
                    child: SvgPicture.asset(
                      suffixIcon!,
                      color: Colors.black,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
          ],
        ),
        addH(37.h),
      ],
    );
  }
}
