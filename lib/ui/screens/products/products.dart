import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/designs/product_card.dart';
import 'package:dogventurehq/ui/screens/products/filter_dialog.dart';
import 'package:dogventurehq/ui/screens/products/sortby_dialog.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductsScreen extends StatefulWidget {
  static String routeName = '/products';
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  String screenTitle = 'Products';

  @override
  void initState() {
    screenTitle = Get.arguments as String;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTitle(
                title: screenTitle,
              ),
              // Sort by & Filter
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomBtn(
                    onPressedFn: () => showDialog(
                      const SortbyDialog(),
                    ),
                    btnTxt: 'Sort by',
                    txtSize: 15.sp,
                    txtWeight: FontWeight.w600,
                    btnColor: Colors.white,
                    txtColor: Colors.black,
                    btnSize: Size(185.w, 45.h),
                    btnIcon: 'assets/svgs/sort.svg',
                  ),
                  CustomBtn(
                    onPressedFn: () => showDialog(
                      const FilterDialog(),
                    ),
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
              Container(
                width: double.infinity,
                height: 690.h,
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GridView.builder(
                  itemCount: 10,
                  // padding: EdgeInsets.symmetric(horizontal: 20.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 0.h,
                    mainAxisSpacing: 30.h,
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
      ),
    );
  }

  void showDialog(Widget showDialog) {
    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.8),
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, anim1, anim2) {
        return showDialog;
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0),
          ).animate(anim1),
          child: child,
        );
      },
    );
  }
}
