import 'package:carousel_slider/carousel_slider.dart';
import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/home.dart';
import 'package:dogventurehq/ui/designs/brand_card.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/product_card.dart';
import 'package:dogventurehq/ui/screens/cart/cart.dart';
import 'package:dogventurehq/ui/screens/home/category_icon.dart';
import 'package:dogventurehq/ui/screens/home/drawer.dart';
import 'package:dogventurehq/ui/screens/home/logo.dart';
import 'package:dogventurehq/ui/screens/home/nav_icon.dart';
import 'package:dogventurehq/ui/screens/home/slider.dart';
import 'package:dogventurehq/ui/screens/products/products.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:dogventurehq/ui/widgets/horizontal_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeCon = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int activeBnrIndex = 0;
  int currentTab = 0;
  final TextEditingController searchCon = TextEditingController();
  @override
  void initState() {
    _homeCon.getBanners();
    _homeCon.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // Drawer
        leading: InkWell(
          onTap: () => _scaffoldKey.currentState!.openDrawer(),
          child: SizedBox(
            width: 22.w,
            height: 20.h,
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/drawer_menu.svg',
                color: Colors.black,
              ),
            ),
          ),
        ),
        centerTitle: true,
        // Logo
        title: const HomeLogo(),
        // Notification Icon
        actions: [
          Container(
            width: 54.w,
            height: 54.h,
            margin: EdgeInsets.only(right: 20.w, top: 10.h),
            decoration: BoxDecoration(
              color: ConstantColors.kF7F8FC,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: ConstantColors.kD4EAFC,
                width: 1,
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/svgs/bell.svg',
              ),
            ),
          )
        ],
      ),
      drawer: HomeDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addH(16.h),
            // Search Field
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: CustomField(
                textCon: searchCon,
                prefixIcon: 'assets/svgs/search.svg',
                hintText: "I'm Looking for...",
                txtFontWeight: FontWeight.w500,
                fillClr: ConstantColors.kF7F8FC,
              ),
            ),
            addH(28.h),
            // Slider
            SizedBox(
              width: double.infinity,
              height: 180.h,
              child: Obx(() {
                if (_homeCon.bannerLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (_homeCon.bannerList.isEmpty) {
                    return const Center(
                      child: Text('Unable to load banners'),
                    );
                  } else {
                    return CarouselSlider.builder(
                      options: CarouselOptions(
                        viewportFraction: 0.77,
                        height: 180.h,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 3),
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          setState(() => activeBnrIndex = index);
                        },
                      ),
                      itemCount: 3,
                      itemBuilder: (context, index, realIndex) {
                        return HomeSlider(
                          onTapFn: () {},
                          imgUrl: _homeCon.bannerList[index].smallImage,
                        );
                      },
                    );
                  }
                }
              }),
            ),
            addH(5.h),
            // Indicator
            AnimatedSmoothIndicator(
              activeIndex: activeBnrIndex,
              count: 3,
              effect: WormEffect(
                dotColor: ConstantColors.k2377A6,
                strokeWidth: 1,
                activeDotColor: ConstantColors.k2377A6,
                paintStyle: PaintingStyle.stroke,
                dotHeight: 7.h,
                dotWidth: 7.w,
                spacing: 8.w,
              ),
            ),
            addH(20.h),
            // Categories
            SizedBox(
              width: 395.w,
              height: 325.h,
              child: Obx(
                () {
                  if (_homeCon.categoryLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (_homeCon.categoryList.isEmpty) {
                      return const Center(
                        child: Text('Unable to load categories'),
                      );
                    } else {
                      return GridView.builder(
                        itemCount: _homeCon.categoryList.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.7,
                        ),
                        itemBuilder: (_, index) {
                          return CategoryIcon(
                            indexValue: index,
                            onTapFn: () => Get.toNamed(
                              ProductsScreen.routeName,
                            ),
                            categoryName: _homeCon.categoryList[index].name,
                            categoryImage:
                                _homeCon.categoryList[index].largeImage,
                          );
                        },
                      );
                    }
                  }
                },
              ),
            ),
            addH(35.h),
            // Deal of the Week
            HorizontalList(
              title: 'Deal of the Week',
              viewAllFn: () {},
            ),
            addH(38.h),
            // Banner
            Image.asset(
              'assets/images/banner2.png',
              height: 180.h,
            ),
            addH(40.h),
            // Flash Deals
            Container(
              width: double.infinity,
              height: 542.h,
              padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
              color: ConstantColors.kD4EAFC,
              child: Column(
                children: [
                  // Title
                  SizedBox(
                    height: 32.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Flash Deals Title
                        Text(
                          'Flash Deals',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantStrings.kFontFamily,
                            color: Colors.black,
                          ),
                        ),
                        // Flash Deals countdown
                        SizedBox(
                          width: 160.h,
                          child: Row(
                            children: [
                              Text(
                                'ends in   ',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: ConstantStrings.kFontFamily,
                                  color: Colors.black,
                                ),
                              ),
                              CustomBtn(
                                onPressedFn: () {},
                                btnTxt: '23:12:58',
                                txtSize: 12.sp,
                                btnSize: Size(96.w, 32.h),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  addH(15.h),
                  // Products
                  SizedBox(
                    width: double.infinity,
                    height: 455.h,
                    child: ListView.builder(
                      itemCount: 2,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProductCard(
                              onTapFn: () {},
                              imgUrl: 'assets/images/watch.png',
                              productName: 'Apple Watch Pair of 2',
                              price: 99.00,
                              cardWidth: 185.w,
                              imgWidth: 174.w,
                            ),
                            ProductCard(
                              onTapFn: () {},
                              imgUrl: 'assets/images/watch.png',
                              productName: 'Apple Watch Pair of 2',
                              price: 99.00,
                              cardWidth: 185.w,
                              imgWidth: 174.w,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            addH(35.h),
            // Shop By Brands
            Container(
              width: double.infinity,
              height: 116.h,
              margin: EdgeInsets.only(left: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shop By Brands',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: ConstantStrings.kFontFamily,
                      color: Colors.black,
                    ),
                  ),
                  addH(9.h),
                  // Brands
                  SizedBox(
                    width: double.infinity,
                    height: 62.h,
                    child: ListView.builder(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return BrandCard(
                          onTapFn: () {},
                          imgUrl: 'assets/images/puma.png',
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            addH(33.h),
            // Food Essentials
            HorizontalList(
              title: 'Food Essentials',
              viewAllFn: () {},
            ),
            addH(34.h),
            // Recommended for you
            HorizontalList(
              title: 'Recommended for you',
              viewAllFn: () {},
            ),
            addH(30.h),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 75.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.w),
            topRight: Radius.circular(15.w),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0.0, -2.0),
              blurRadius: 5.w,
              spreadRadius: 5.w,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Home Icon
            NavIcon(
              onTapFn: () {},
              icon: 'assets/svgs/home.svg',
              title: 'Home',
            ),
            // Orders Icon
            NavIcon(
              onTapFn: () {},
              icon: 'assets/svgs/orders.svg',
              title: 'Orders',
            ),
            Container(
              width: 70.w,
              height: 75.h,
              padding: EdgeInsets.only(top: 25.h),
              child: Center(
                child: Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: ConstantStrings.kFontFamily,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
            ),
            // Cart Icon
            NavIcon(
              onTapFn: () => Get.toNamed(CartScreen.routeName),
              icon: 'assets/svgs/cart.svg',
              title: 'Cart',
            ),
            // Profile Icon
            NavIcon(
              onTapFn: () {},
              icon: 'assets/svgs/profile.svg',
              title: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 60.w,
        height: 60.h,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          // shadow
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0.0, 2.0),
              blurRadius: 5.w,
              spreadRadius: 5.w,
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            'assets/images/category.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
