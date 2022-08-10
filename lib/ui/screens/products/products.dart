import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/product_card.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsScreen extends StatelessWidget {
  static String routeName = '/products';
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            addH(65.h),
            // Title
            Row(
              children: [
                addW(20.w),
                SizedBox(
                  width: 28.w,
                  height: 28.h,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/svgs/back.svg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  'Food Essentials',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: ConstantStrings.kFontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            addH(37.h),
            // Sort by & Filter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBtn(
                  onPressedFn: () {},
                  btnTxt: 'Sort by',
                  txtSize: 15.sp,
                  txtWeight: FontWeight.w600,
                  btnColor: Colors.white,
                  txtColor: Colors.black,
                  btnSize: Size(185.w, 45.h),
                  btnIcon: 'assets/svgs/sort.svg',
                ),
                CustomBtn(
                  onPressedFn: () {},
                  btnTxt: 'Filter',
                  txtSize: 15.sp,
                  txtWeight: FontWeight.w600,
                  btnColor: Colors.white,
                  txtColor: Colors.black,
                  btnSize: Size(185.w, 45.h),
                  btnIcon: 'assets/svgs/filter.svg',
                ),
              ],
            ),
            addH(17.h),
            // Products
            SizedBox(
              width: double.infinity,
              height: 690.h,
              child: GridView.builder(
                itemCount: 10,
                // padding: EdgeInsets.symmetric(horizontal: 20.w),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.h,
                  mainAxisSpacing: 10.h,
                  mainAxisExtent: 220.h,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ProductCard(
                    cardWidth: 188.w,
                    onTapFn: () {},
                    imgUrl: 'assets/images/watch.png',
                    productName: 'Whole Wheat Flour',
                    price: 99.00,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
