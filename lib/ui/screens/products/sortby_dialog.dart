import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortbyDialog extends StatefulWidget {
  const SortbyDialog({
    Key? key,
  }) : super(key: key);

  @override
  State<SortbyDialog> createState() => _SortbyDialogState();
}

class _SortbyDialogState extends State<SortbyDialog> {
  List<String> sortByList = [
    'Recommended',
    'Recently Added',
    'Price: Low to High',
    'Price: High to Low',
    'Top Rated',
  ];
  int sortByIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.all(0),
      titlePadding: EdgeInsets.symmetric(horizontal: 10.w),
      contentPadding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      content: Container(
        height: 390.h,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SORT BY',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade600,
              ),
            ),
            addH(15.h),
            Column(
              children: sortByList
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
                          value: sortByList.indexOf(e),
                          groupValue: sortByIndex,
                          onChanged: (value) => setState(
                            () => sortByIndex = value as int,
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
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
