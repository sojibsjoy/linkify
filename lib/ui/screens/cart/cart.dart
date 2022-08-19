import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/screens/cart/cart_item.dart';
import 'package:dogventurehq/ui/screens/cart/summary_item.dart';
import 'package:dogventurehq/ui/screens/checkout/checkout.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final TextEditingController _voucherCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              // Title
              CustomTitle(title: 'My Cart'),
              // Cart Items
              Expanded(
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const CartItem();
                  },
                ),
              ),
              // Summary
              SizedBox(
                width: 388.w,
                height: 125.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Summary',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: ConstantStrings.kFontFamily,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    // Sub Total
                    const SummaryItem(
                      title: 'Sub Total',
                      price: 'AED 2,360',
                    ),
                    // Vat
                    const SummaryItem(
                      title: 'VAT',
                      price: 'AED 30',
                    ),
                    // Order Total
                    const SummaryItem(
                      title: 'Order Total',
                      price: 'AED 2,390',
                    ),
                  ],
                ),
              ),
              // Discount Code & Apply Button
              Container(
                width: 388.w,
                height: 45.h,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(5.r)),
                child: Row(
                  children: [
                    // Voucher Field
                    SizedBox(
                      width: 295.w,
                      child: CustomField(
                        textCon: _voucherCon,
                        hintText: 'Put Discount Voucher',
                      ),
                    ),
                    // Apply Button
                    CustomBtn(
                      onPressedFn: () {},
                      btnTxt: 'Apply',
                      btnSize: Size(93.w, 45.h),
                    ),
                  ],
                ),
              ),
              addH(20.h),
              // Total Amount
              Container(
                width: 388.w,
                height: 45.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: const SummaryItem(
                  title: 'Total Amount',
                  price: 'AED 2,390',
                ),
              ),
              addH(30.h),
              // Continue Shopping & Checkout Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomBtn(
                    onPressedFn: () {},
                    btnTxt: 'Continue Shopping',
                    btnSize: Size(193.w, 45.h),
                    txtColor: Colors.black,
                    btnColor: Colors.white,
                    txtSize: 15.sp,
                    txtWeight: FontWeight.w400,
                  ),
                  CustomBtn(
                    onPressedFn: () => Get.toNamed(CheckoutScreen.routeName),
                    btnTxt: 'Checkout',
                    btnSize: Size(193.w, 45.h),
                  ),
                ],
              ),
              addH(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
