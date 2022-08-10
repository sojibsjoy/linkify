import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/home/category_icon.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class CategoriesScreen extends StatefulWidget {
  static String routeName = '/categories';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  int _selectedCategory = 3;
  final TextEditingController _searchCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            children: [
              // Title and search bar
              Row(
                children: [
                  addH(80.h),
                  // Tittle
                  Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: ConstantStrings.kFontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  addW(10.w),
                  // Search Box
                  CustomField(
                    textCon: _searchCon,
                    width: 280.w,
                    fillClr: ConstantColors.kF7F8FC,
                    prefixIcon: 'assets/svgs/search.svg',
                    hintText: 'What are you looking for?',
                  ),
                ],
              ),
              // Categories
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Parent Category
                  Container(
                    width: 85.w,
                    height: 770.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: ConstantColors.kF7F8FC,
                    ),
                    child: ListView.builder(
                      itemCount: 12,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () =>
                              setState(() => _selectedCategory = index),
                          child: ClipPath(
                            clipper: ShapeBorderClipper(
                              shape: RoundedRectangleBorder(
                                borderRadius: _selectedCategory == index
                                    ? BorderRadius.only(
                                        topLeft: Radius.circular(5.w),
                                        bottomLeft: Radius.circular(5.w),
                                      )
                                    : BorderRadius.zero,
                              ),
                            ),
                            child: Container(
                              height: 70.h,
                              decoration: BoxDecoration(
                                color: _selectedCategory == index
                                    ? Colors.white
                                    : Colors.transparent,
                                border: Border(
                                  bottom: BorderSide(
                                    color: _selectedCategory == index
                                        ? ConstantColors.k06C8FF
                                        : Colors.transparent,
                                    width: 1.w,
                                  ),
                                  top: BorderSide(
                                    color: _selectedCategory == index
                                        ? ConstantColors.k06C8FF
                                        : index != 0
                                            ? Colors.transparent
                                            : ConstantColors.kD4EAFC,
                                    width: 1.w,
                                  ),
                                  left: BorderSide(
                                    color: _selectedCategory == index
                                        ? ConstantColors.k06C8FF
                                        : ConstantColors.kD4EAFC,
                                    width: 1.w,
                                  ),
                                  right: BorderSide(
                                    color: _selectedCategory == index
                                        ? Colors.white
                                        : ConstantColors.kD4EAFC,
                                    width: 1.w,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Category Number $index',
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: ConstantStrings.kFontFamily,
                                    fontWeight: _selectedCategory == index
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  addW(13.w),
                  // Sub Categories
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sub Category Title
                      Text(
                        'Kitchen Appliances',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: ConstantStrings.kFontFamily,
                          color: Colors.black,
                        ),
                      ),
                      addH(10.h),
                      // Sub Cateogries
                      SizedBox(
                        width: 295.w,
                        height: 320.h,
                        child: GridView.builder(
                          itemCount: 7,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.95,
                          ),
                          itemBuilder: (_, index) {
                            return CategoryIcon(
                              indexValue: index,
                              onTapFn: () =>
                                  Get.toNamed(ProductsScreen.routeName),
                              categoryName: 'Microware',
                              totalWidth: 60.w,
                              txtSize: 12.sp,
                              txtWeight: FontWeight.w500,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
