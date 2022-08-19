import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class FilterList extends StatefulWidget {
  final List<String> filterList;
  const FilterList({
    Key? key,
    required this.filterList,
  }) : super(key: key);

  @override
  State<FilterList> createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40.h,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: CustomBtn(
              onPressedFn: () => setState(
                () => selectedItem = index,
              ),
              btnTxt: widget.filterList[index],
              txtSize: 14.sp,
              txtWeight: FontWeight.w600,
              btnColor:
                  selectedItem == index ? ConstantColors.k87C1DF : Colors.white,
              txtColor: Colors.black,
              btnBorderColor: ConstantColors.k0F98FF,
              btnSize: Size(120.w, 45.h),
              btnIcon: 'assets/svgs/reset.svg',
            ),
          );
        },
      ),
    );
  }
}
