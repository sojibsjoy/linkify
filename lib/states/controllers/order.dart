import 'dart:convert';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/order.dart';
import 'package:dogventurehq/states/models/order_response.dart';
import 'package:dogventurehq/states/services/order.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxBool orderLoading = true.obs;
  RxBool currentOrderLoading = true.obs;
  RxBool previousOrderLoading = true.obs;
  RxBool frequentOrderLoading = true.obs;

  OrderModel? orderModel;
  var currentOrderList = <OrderResponseModel>[].obs;
  var previousOrderList = <OrderResponseModel>[].obs;
  var frequentOrderList = <OrderResponseModel>[].obs;

  // Current Order List
  void getOrders({
    required RxBool loadingFlag,
    required RxList<OrderResponseModel> orderList,
    required String orderApi,
    required int userID,
  }) async {
    loadingFlag(true);
    try {
      var response = await OrderService.getOrders(
        api: orderApi,
        userId: userID,
      );
      orderList.value = orderModelListFromJson(jsonEncode(response));
    } finally {
      loadingFlag(false);
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
