import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/products.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/cart_item.dart';
import 'package:dogventurehq/states/models/user.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_field.dart';
import 'package:dogventurehq/ui/designs/custom_item.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/designs/quantity_edit.dart';
import 'package:dogventurehq/ui/screens/cart/summary_item.dart';
import 'package:dogventurehq/ui/screens/checkout/checkout.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ProductsController _productsCon = Get.find<ProductsController>();
  final TextEditingController _voucherCon = TextEditingController();
  UserModel? userModel;
  double _subTotal = 0.0;

  @override
  void initState() {
    userModel = Preference.getUserDetails();
    _productsCon.getCartItems(userModel!.customerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _subTotal = 0;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              // Title
              CustomTitle(title: 'My Cart'),
              Obx(() {
                if (_productsCon.cartItemsLoading.value) {
                  return Padding(
                    padding: EdgeInsets.only(top: 300.h),
                    child: const CircularProgressIndicator(),
                  );
                } else {
                  if (_productsCon.cartItemList.isEmpty) {
                    return Padding(
                      padding: EdgeInsets.only(top: 300.h),
                      child: const Text('No Data Found!'),
                    );
                  } else {
                    for (CartItemModel item in _productsCon.cartItemList) {
                      _subTotal +=
                          item.unitPrice.round() * item.quantity.round();
                    }
                    print("Sub Total: $_subTotal");
                    return Column(
                      children: [
                        // Cart Items
                        SizedBox(
                          height: 420.h,
                          child: ListView.builder(
                            itemCount: _productsCon.cartItemList.length,
                            itemBuilder: (context, index) {
                              return CustomItem(
                                imgLink: _productsCon
                                    .cartItemList[index].smallImage!,
                                productName: _productsCon
                                    .cartItemList[index].productName!,
                                price:
                                    _productsCon.cartItemList[index].unitPrice,
                                deleteIconFn: () {
                                  _productsCon.removeItemFromCart(
                                    cartID: _productsCon
                                        .cartItemList[index].cartId!,
                                  );
                                  Get.defaultDialog(
                                    title: 'Deleting...',
                                    content: Obx(
                                      () {
                                        if (_productsCon
                                            .removeItemFromCartLoading.value) {
                                          return SizedBox(
                                            height: 100.h,
                                            child: const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          );
                                        } else {
                                          Future.delayed(
                                            const Duration(seconds: 2),
                                            () {
                                              Get.back();
                                              _productsCon.getCartItems(
                                                userModel!.customerId,
                                              );
                                            },
                                          );
                                          return const Center(
                                            child: Text('Delete Successfully'),
                                          );
                                        }
                                      },
                                    ),
                                  );
                                },
                                child: QuantityEdit(
                                  quantity: _productsCon
                                      .cartItemList[index].quantity
                                      .round(),
                                  decreaseFn: () {
                                    if (_productsCon
                                            .cartItemList[index].quantity ==
                                        1) {
                                      return;
                                    }
                                    setState(
                                      () => _productsCon
                                          .cartItemList[index].quantity--,
                                    );
                                  },
                                  increaseFn: () async {
                                    // CartItemModel cItem =
                                    //     _productsCon.cartItemList[index];
                                    // cItem.quantity = 1;
                                    // bool isAdded = await _productsCon.addToCart(
                                    //   cItem,
                                    // );
                                    // if (isAdded) {
                                    setState(
                                      () => _productsCon
                                          .cartItemList[index].quantity++,
                                    );
                                    // }
                                  },
                                ),
                              );
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
                              SummaryItem(
                                title: 'Sub Total',
                                price: 'AED $_subTotal',
                              ),
                              // Vat
                              const SummaryItem(
                                title: 'VAT',
                                price: 'AED 00',
                              ),
                              // Order Total
                              SummaryItem(
                                title: 'Order Total',
                                price: 'AED $_subTotal',
                              ),
                            ],
                          ),
                        ),
                        // Discount Code & Apply Button
                        Container(
                          width: 388.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r)),
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
                          child: SummaryItem(
                            title: 'Total Amount',
                            price: 'AED $_subTotal',
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
                              onPressedFn: () =>
                                  Get.toNamed(CheckoutScreen.routeName),
                              btnTxt: 'Checkout',
                              btnSize: Size(193.w, 45.h),
                            ),
                          ],
                        ),
                        addH(20.h),
                      ],
                    );
                  }
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
