import 'package:carousel_slider/carousel_slider.dart';
import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/product_card.dart';
import 'package:dogventurehq/ui/screens/home/category_icon.dart';
import 'package:dogventurehq/ui/screens/home/slider.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeBnrIndex = 0;
  final TextEditingController searchCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: SizedBox(
          width: 22.w,
          height: 20.h,
          child: Center(
            child: SvgPicture.asset(
              'assets/svgs/menu.svg',
            ),
          ),
        ),
        centerTitle: true,
        title: SizedBox(
          width: 152.w,
          height: 24.h,
          child: Center(
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
        ),
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
            CarouselSlider.builder(
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
                  imgUrl: 'assets/images/banner1.png',
                );
              },
            ),
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
              height: 225.h,
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryIcon(
                        onTapFn: () {},
                        categoryName: 'Gadget',
                        imgUrl: index % 2 != 0
                            ? 'assets/images/beauty.png'
                            : 'assets/images/gadget.png',
                        bgClr: index % 2 != 0 ? ConstantColors.kDED4FC : null,
                      ),
                      CategoryIcon(
                        onTapFn: () {},
                        categoryName: 'Beauty',
                        imgUrl: index % 2 != 0
                            ? 'assets/images/beauty.png'
                            : 'assets/images/gadget.png',
                        bgClr: index % 2 != 0 ? ConstantColors.kDED4FC : null,
                      ),
                    ],
                  );
                },
              ),
            ),
            addH(35.h),
            // Deal of the Week
            Container(
              width: double.infinity,
              height: 255.h,
              margin: EdgeInsets.only(left: 20.w),
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
                          'Deal of the Week',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantStrings.kFontFamily,
                            color: Colors.black,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            //TODO: Go to all deals screen
                          },
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
                        return ProductCard(
                          onTapFn: () {},
                          imgUrl: 'assets/images/watch.png',
                          productName: 'Apple Watch Pair of 2',
                          price: 99.00,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            addH(35.h),
          ],
        ),
      ),
    );
  }
}
