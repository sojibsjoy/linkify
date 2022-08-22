import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/home.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/screens/home/category_icon.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  static String routeName = '/categories';
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final HomeController _homeCon = Get.find<HomeController>();
  int _selectedCategory = 0;
  final TextEditingController _searchCon = TextEditingController();

  @override
  void initState() {
    _homeCon.getSubCategories(_homeCon.categoryList[0].categoryId);
    super.initState();
  }

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
                    width: 260.w,
                    fillClr: ConstantColors.kF7F8FC,
                    prefixIcon: 'assets/svgs/search.svg',
                    hintText: 'What are you looking for?',
                    txtSize: 12.sp,
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
                    height: 750.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: ConstantColors.kF7F8FC,
                    ),
                    child: ListView.builder(
                      itemCount: _homeCon.categoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () => setState(() {
                            _selectedCategory = index;
                            _homeCon.getSubCategories(
                              _homeCon.categoryList[index].categoryId,
                            );
                          }),
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
                                  _homeCon.categoryList[index].name,
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
                        _homeCon.categoryList[_selectedCategory].name,
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
                        height: 715.h,
                        child: Obx(
                          () {
                            if (_homeCon.subCategoryLoading.value) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (_homeCon.subCategoryList.isEmpty) {
                                return Center(
                                  child: Text(
                                    'No sub categories found',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: ConstantStrings.kFontFamily,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              } else {
                                return GridView.builder(
                                  itemCount: _homeCon.subCategoryList.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 12,
                                    childAspectRatio: 0.85,
                                  ),
                                  itemBuilder: (_, index) {
                                    return CategoryIcon(
                                      indexValue: index,
                                      onTapFn: () => Get.toNamed(
                                        ProductsScreen.routeName,
                                        arguments: _homeCon
                                            .subCategoryList[_selectedCategory]
                                            .name,
                                      ),
                                      categoryName:
                                          _homeCon.subCategoryList[index].name,
                                      categoryImage: _homeCon
                                          .subCategoryList[index].largeImage,
                                      totalWidth: 70.w,
                                      txtSize: 12.sp,
                                      txtWeight: FontWeight.w500,
                                    );
                                  },
                                );
                              }
                            }
                          },
                        ),
                      ),
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
