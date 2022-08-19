import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddressItem extends StatelessWidget {
  String? suffixText;
  AddressItem({
    Key? key,
    this.suffixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 388.w,
      height: 100.h,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: ConstantColors.kF3F3F3,
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Address Icon
          SizedBox(
            width: 50.w,
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/address_icon.svg',
              ),
            ),
          ),
          // Address Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 330.w,
                height: 20.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Address Title
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Edit & Delete Icon
                    SizedBox(
                      width: suffixText == null ? 55.w : 80.w,
                      height: 20.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/svgs/edit.svg',
                          ),
                          if (suffixText == null)
                            SvgPicture.asset(
                              'assets/svgs/delete.svg',
                            ),
                          if (suffixText != null)
                            Text(
                              suffixText!,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 13.sp,
                                fontFamily: ConstantStrings.kFontFamily,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              addH(5.h),
              Text(
                'Ulaya District, Nairobi, Kenya',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14.sp,
                  fontFamily: ConstantStrings.kFontFamily,
                ),
              ),
              addH(5.h),
              Text(
                'Phone Number: +91 1234567890',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontFamily: ConstantStrings.kFontFamily,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
