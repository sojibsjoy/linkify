import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/order.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/user.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_item.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/screens/orders/row_text.dart';
import 'package:dogventurehq/ui/widgets/helper_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends StatefulWidget {
  static String routeName = '/orders';
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  final OrderController _orderCon = Get.find<OrderController>();
  UserModel? userModel;
  int _selectedBtnIndex = 0;

  @override
  void initState() {
    userModel = Preference.getUserDetails();
    if (userModel != null) {
      _orderCon.getCurrentOrders(userID: userModel!.customerId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomTitle(title: 'My Orders'),
            addH(20.h),
            // current, previous & frequent btn
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // current custom btn
                CustomBtn(
                  onPressedFn: () {
                    setState(() => _selectedBtnIndex = 0);
                  },
                  btnTxt: 'Current',
                  btnSize: Size(120.w, 40.h),
                  btnBorderColor: ConstantColors.k0F98FF,
                  txtColor: Colors.black,
                  btnColor: _selectedBtnIndex == 0
                      ? ConstantColors.k87C1DF
                      : Colors.white,
                ),
                // previous custom btn
                CustomBtn(
                  onPressedFn: () {
                    setState(() => _selectedBtnIndex = 1);
                  },
                  btnTxt: 'Previous',
                  btnSize: Size(120.w, 40.h),
                  btnBorderColor: ConstantColors.k0F98FF,
                  txtColor: Colors.black,
                  btnColor: _selectedBtnIndex == 1
                      ? ConstantColors.k87C1DF
                      : Colors.white,
                ),
                // frequent custom btn
                CustomBtn(
                  onPressedFn: () {
                    setState(() => _selectedBtnIndex = 2);
                  },
                  btnTxt: 'Frequent',
                  btnSize: Size(120.w, 40.h),
                  btnBorderColor: ConstantColors.k0F98FF,
                  txtColor: Colors.black,
                  btnColor: _selectedBtnIndex == 2
                      ? ConstantColors.k87C1DF
                      : Colors.white,
                ),
              ],
            ),
            addH(20.h),
            // List of orders
            Obx(() {
              if (_orderCon.currentOrderLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (_orderCon.currentOrderList.isEmpty) {
                  return Center(
                    child: Text(ConstantStrings.kNoData),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: _orderCon.currentOrderList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomItem(
                          imgLink: _orderCon.currentOrderList[index]
                              .invoiceDetailsViewModels[0].largeImage,
                          productName: _orderCon.currentOrderList[index]
                              .invoiceDetailsViewModels[0].productName,
                          price: _orderCon.currentOrderList[index].totalAmount,
                          deleteIconFn: () {
                            // TODO: add delete function
                          },
                          child: SizedBox(
                            width: 265.w,
                            child: Column(
                              children: [
                                const RowText(
                                  text1: 'Invoice Number',
                                  text2: 'Expected Delivery',
                                  isBold: false,
                                ),
                                addH(5.h),
                                const RowText(
                                  text1: 'ABC123456',
                                  text2: '22-06-2022',
                                  isBold: true,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            }),
          ],
        ),
      ),
    );
  }
}
