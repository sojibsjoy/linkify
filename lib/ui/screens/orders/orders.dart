import 'package:dogventurehq/constants/colors.dart';
import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/controllers/order.dart';
import 'package:dogventurehq/states/data/prefs.dart';
import 'package:dogventurehq/states/models/user.dart';
import 'package:dogventurehq/ui/designs/custom_btn.dart';
import 'package:dogventurehq/ui/designs/custom_title.dart';
import 'package:dogventurehq/ui/screens/orders/order_list.dart';
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
      _orderCon.getOrders(
        loadingFlag: _orderCon.currentOrderLoading,
        orderList: _orderCon.currentOrderList,
        orderApi: ConstantStrings.kOrderAPI,
        userID: userModel!.customerId,
      );
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
                    if (_orderCon.currentOrderList.isEmpty) {
                      _orderCon.getOrders(
                        loadingFlag: _orderCon.currentOrderLoading,
                        orderList: _orderCon.currentOrderList,
                        orderApi: ConstantStrings.kOrderAPI,
                        userID: userModel!.customerId,
                      );
                    }
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
                    if (_orderCon.previousOrderList.isEmpty) {
                      _orderCon.getOrders(
                        loadingFlag: _orderCon.previousOrderLoading,
                        orderList: _orderCon.previousOrderList,
                        orderApi: ConstantStrings.kPreviousOrderAPI,
                        userID: userModel!.customerId,
                      );
                    }
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
                    if (_orderCon.frequentOrderList.isEmpty) {
                      _orderCon.getOrders(
                        loadingFlag: _orderCon.frequentOrderLoading,
                        orderList: _orderCon.frequentOrderList,
                        orderApi: ConstantStrings.kLatestOrderAPI,
                        userID: userModel!.customerId,
                      );
                    }
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
            getOrderList(),
          ],
        ),
      ),
    );
  }

  Widget getOrderList() {
    switch (_selectedBtnIndex) {
      case 0:
        return OrderList(
          loadingFlag: _orderCon.currentOrderLoading,
          orderList: _orderCon.currentOrderList,
        );
      case 1:
        return OrderList(
          loadingFlag: _orderCon.previousOrderLoading,
          orderList: _orderCon.previousOrderList,
        );
      case 2:
        return OrderList(
          loadingFlag: _orderCon.frequentOrderLoading,
          orderList: _orderCon.frequentOrderList,
        );
      default:
        return Text(
          ConstantStrings.kWentWrong,
        );
    }
  }
}
