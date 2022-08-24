import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/product_card.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dogventurehq/constants/colors.dart';

class HorizontalList extends StatelessWidget {
  final String title;
  final VoidCallback viewAllTxtFn;
  const HorizontalList({
    Key? key,
    required this.title,
    required this.viewAllTxtFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 255.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Container(
            height: 27.h,
            padding: EdgeInsets.only(right: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: ConstantStrings.kFontFamily,
                    color: Colors.black,
                  ),
                ),
                InkWell(
                  onTap: viewAllTxtFn,
                  child: Text(
                    'View All Products',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: ConstantStrings.kFontFamily,
                      color: ConstantColors.k2377A6,
                    ),
                  ),
                ),
              ],
            ),
          ),
          addH(5.h),
          // Products
          SizedBox(
            width: double.infinity,
            height: 220.h,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Text("data");
                // return ProductCard(
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
