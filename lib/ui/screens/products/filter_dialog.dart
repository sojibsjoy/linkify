import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/screens/products/filter_list.dart';
import 'package:dogventurehq/ui/screens/products/filter_title.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<String> categories = [
    'Home Decor',
    'Wearable',
    'Electronics',
  ];
  List<String> brands = [
    'Ardell',
    'Braun',
    'Duran',
  ];
  List<String> reviewOptions = [
    '* * * * & Up',
    '* * * & Up',
    '* * & Up',
  ];
  double _sliderValue = 0.0;
  int selectedCategory = 0;
  int reviewIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.all(0),
      titlePadding: EdgeInsets.symmetric(horizontal: 10.w),
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
        height: 718.h,
        width: 428.w,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.r),
            topRight: Radius.circular(15.r),
          ),
        ),
        child: Column(
          children: [
            // back, title, reset
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 18,
                    color: Colors.grey.shade800,
                  ),
                ),
                Text(
                  'Filter',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: ConstantStrings.kFontFamily,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                CustomBtn(
                  onPressedFn: () {},
                  btnTxt: 'Reset',
                  txtSize: 16.sp,
                  txtWeight: FontWeight.w600,
                  btnColor: Colors.white,
                  txtColor: Colors.black,
                  btnBorderColor: Colors.transparent,
                  btnSize: Size(80.w, 45.h),
                  btnIcon: 'assets/svgs/reset.svg',
                ),
              ],
            ),
            addH(10.h),
            // category, view all
            FilterTitle(
              title: 'Category',
              onTapFn: () {},
            ),
            addH(10.h),
            // category list
            FilterList(filterList: categories),
            addH(30.h),
            // brand, view all
            FilterTitle(
              title: 'Brand',
              onTapFn: () {},
            ),
            addH(10.h),
            // brand list
            FilterList(filterList: brands),
            addH(30.h),
            // price range
            FilterTitle(
              title: 'Price Range',
              suffixTxt: 'AED 0 - AED 695',
              suffixIcon: Icons.keyboard_arrow_up,
              suffixIconSize: 25,
              onTapFn: () {},
            ),
            addH(10.h),
            // price range slider
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: ConstantColors.k656E72,
                  inactiveTrackColor: Colors.grey.shade300,
                  thumbColor: ConstantColors.k06C8FF,
                  overlayColor: Colors.black.withAlpha(32),
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.w),
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 20.w),
                ),
                child: Slider(
                  value: _sliderValue,
                  min: 0.0,
                  max: 695.0,
                  onChanged: (double value) => setState(
                    () => _sliderValue = value,
                  ),
                ),
              ),
            ),
            addH(30.h),
            // Customer Review
            FilterTitle(
              title: 'Customer Review',
              suffixTxt: '',
              suffixIcon: Icons.keyboard_arrow_up,
              suffixIconSize: 25,
              onTapFn: () {},
            ),
            addH(10.h),
            // Review Options
            Column(
              children: reviewOptions
                  .map(
                    (e) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        // Radio button
                        Radio(
                          value: reviewOptions.indexOf(e),
                          groupValue: reviewIndex,
                          onChanged: (value) => setState(
                            () => reviewIndex = value as int,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            addH(30.h),
            // Apply Button
            Center(
              child: CustomBtn(
                onPressedFn: () {},
                btnTxt: 'Apply',
                btnSize: Size(185.w, 45.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
