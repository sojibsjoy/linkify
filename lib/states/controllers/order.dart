import 'dart:convert';

import 'package:dogventurehq/states/models/order.dart';
import 'package:dogventurehq/states/models/order_response.dart';
import 'package:dogventurehq/states/services/order.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxBool orderLoading = true.obs;
  RxBool currentOrderLoading = true.obs;

  OrderModel? orderModel;
  var currentOrderList = <OrderResponseModel>[].obs;

  // Current Order List
  void getCurrentOrders({required int userID}) async {
    currentOrderLoading.value = true;
    try {
      var response = await OrderService.getCurrentOrders(userID);
      currentOrderList.value = orderModelListFromJson(jsonEncode(response));
    } finally {
      currentOrderLoading.value = false;
    }
  }

  // place order
  void placeOrder({required dynamic payload}) async {
    orderLoading(true);
    try {
      var response = await OrderService.placeOrder(payload);
      orderModel = orderModelFromJson(jsonEncode(response["order"]));
    } finally {
      orderLoading(false);
    }
  }
}
