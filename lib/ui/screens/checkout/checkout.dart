import 'dart:developer';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/address.dart';
import 'package:dogventurehq/states/controllers/order.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/address.dart';
import 'package:dogventurehq/states/models/cart_item.dart';
import 'package:dogventurehq/states/models/order.dart';
import 'package:dogventurehq/states/models/user.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/screens/checkout/payment_body.dart';
import 'package:dogventurehq/ui/screens/checkout/shipping_body.dart';
import 'package:dogventurehq/ui/screens/thankyou/thankyou.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatefulWidget {
  static String routeName = '/checkout';
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final OrderController _checkoutCon = Get.find<OrderController>();
  final AddressController _addressCon = Get.find<AddressController>();
  bool _showPaymentOptions = false;
  List<CartItemModel>? _cartItems;
  double _totalPrice = 0.0;
  AddressModel? _selectedAddress;
  DateTime? _scheduleDate;
  UserModel? userModel;

  @override
  void initState() {
    _cartItems = Get.arguments[0];
    _totalPrice = Get.arguments[1];
    userModel = Preference.getUserDetails();
    _addressCon.getAddresses(
      customerID: userModel!.customerId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              CustomTitle(title: 'Checkout'),
              addH(20.h),
              // Status
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svgs/check_colored.svg',
                  ),
                  Container(
                    width: 150.w,
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    color: Colors.grey,
                  ),
                  SvgPicture.asset(
                    _showPaymentOptions
                        ? 'assets/svgs/check_colored.svg'
                        : 'assets/svgs/check.svg',
                  ),
                ],
              ),
              addH(10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  addW(40.w),
                  Text(
                    'Shipping',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: ConstantStrings.kFontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  addW(100.h),
                  Text(
                    'Review & Payment',
                    style: TextStyle(
                      fontFamily: ConstantStrings.kFontFamily,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
              addH(20.h),
              _showPaymentOptions
                  ? const PaymentBody()
                  : ShippingBody(
                      addressCon: _addressCon,
                      getSelectedAddress: (AddressModel aModel) => setState(
                        () => _selectedAddress = aModel,
                      ),
                      scheduleDeliveryFn: (date) => _scheduleDate = date,
                    ),
              const Spacer(),
              // Proceed button
              Center(
                child: CustomBtn(
                  onPressedFn: _showPaymentOptions
                      ? () {
                          print(_totalPrice);
                          // hit place order here
                          // Get.toNamed(ThankyouScreen.routeName);
                          List<InvoiceDetailsRequestModel>
                              invoiceDetailsRequestList =
                              List.empty(growable: true);
                          for (CartItemModel item in _cartItems!) {
                            invoiceDetailsRequestList.add(
                              InvoiceDetailsRequestModel(
                                productMasterId: item.productMasterId,
                                quantity: item.quantity,
                                price: item.unitPrice,
                                productSubSkuId: item.productSubSkuId,
                              ),
                            );
                          }

                          OrderModel orderModel = OrderModel(
                            customerId: userModel!.customerId,
                            totalAmount: _totalPrice,
                            receivedAmt: _totalPrice,
                            countryId: _selectedAddress!.countryId,
                            stateId: _selectedAddress!.stateId,
                            cityId: _selectedAddress!.cityId,
                            invoiceRequestModels: [
                              InvoiceRequestModel(
                                totalAmount: _totalPrice,
                                receivedAmt: _totalPrice,
                                storeId: _cartItems![0].storeId,
                                supplierId: _cartItems![0].supplierId,
                                invoiceDetailsRequestModels:
                                    invoiceDetailsRequestList,
                              ),
                            ],
                            paymentRequestModels: [
                              PaymentRequestModel(
                                paymentMethod: 1,
                              ),
                            ],
                            billingShippingAddressRequestModels: [
                              BillingShippingAddressRequestModel(
                                customerId: userModel!.customerId,
                                customerAddressId:
                                    _selectedAddress!.customerAddressId,
                              ),
                            ],
                          );
                          log(orderModel.toJson().toString());
                          _checkoutCon.placeOrder(payload: orderModel.toJson());
                          Get.defaultDialog(
                            title: 'Processing...',
                            content: Obx(
                              () {
                                if (_checkoutCon.orderLoading.value) {
                                  return SizedBox(
                                    height: 100.h,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                } else {
                                  Future.delayed(
                                    const Duration(seconds: 2),
                                    () => Get.offAllNamed(
                                      ThankyouScreen.routeName,
                                      arguments:
                                          _checkoutCon.orderModel!.refNumber,
                                    ),
                                  );
                                  return const Center(
                                    child: Text('Order Placed!'),
                                  );
                                }
                              },
                            ),
                          );
                        }
                      : () {
                          _selectedAddress ??= _addressCon.addressList[0];
                          _scheduleDate ??= DateTime.now().add(
                            const Duration(days: 3),
                          );
                          print(_selectedAddress!.addressType);
                          print(_scheduleDate);
                          setState(() => _showPaymentOptions = true);
                        },
                  btnTxt: _showPaymentOptions ? 'Checkout' : 'Proceed',
                  btnSize: Size(255.w, 46.h),
                ),
              ),
              addH(35.h)
            ],
          ),
        ),
      ),
    );
  }
}
