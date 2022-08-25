import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/products.dart';
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
  final ProductsController _productsCon = Get.find<ProductsController>();
  int categoryId = 0;
  String screenTitle = 'Products';

  @override
  void initState() {
    categoryId = Get.arguments[0];
    print('Category ID: $categoryId');
    screenTitle = Get.arguments[1];
    _productsCon.getProducts(categoryId);
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
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Obx(() {
                  if (_productsCon.productsLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (_productsCon.productList.isEmpty) {
                      return  Center(
                        child: Text(
                          ConstantStrings.kNoData,
                        ),
                      );
                    } else {
                      return GridView.builder(
                        itemCount: _productsCon.productList.length,
                        // padding: EdgeInsets.symmetric(horizontal: 20.w),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.h,
                          mainAxisSpacing: 10.h,
                          mainAxisExtent: 240.h,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return ProductCard(
                            pModel: _productsCon.productList[index],
                            imgWidth: 185.w,
                            imgHeight: 155.h,
                          );
                        },
                      );
                    }
                  }
                }),
              )
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
