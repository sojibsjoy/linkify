import 'dart:convert';

import 'package:dogventurehq/states/models/cart_item.dart';
import 'package:dogventurehq/states/models/products.dart';
import 'package:dogventurehq/states/services/products.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  RxBool productsLoading = true.obs;
  RxBool cartItemsLoading = true.obs;
  RxBool addToCartLoading = true.obs;
  RxBool removeItemFromCartLoading = true.obs;

  var productList = <ProductModel>[].obs;
  var cartItemList = <CartItemModel>[].obs;
  CartItemModel? carRequestModel;

  void getProducts(int categoryId) async {
    productsLoading(true);
    try {
      var response = await ProductsService.getProducts(categoryId: categoryId);
      productList.value = productsModelFromJson(jsonEncode(response));
    } finally {
      productsLoading(false);
    }
  }

  Future<bool> addToCart(CartItemModel cModel) async {
    addToCartLoading(true);
    try {
      var response = await ProductsService.addToCart(payload: cModel.toJson());
      carRequestModel = CartItemModel.fromJson(response);
      return true;
    } finally {
      addToCartLoading(false);
    }
  }

  void getCartItems(int customerID) async {
    cartItemsLoading(true);
    try {
      var response = await ProductsService.getCartItems(customerId: customerID);
      cartItemList.value = cartItemListModelFromJson(jsonEncode(response));
    } finally {
      cartItemsLoading(false);
    }
  }

  Future<bool> removeItemFromCart({required int cartID}) async {
    removeItemFromCartLoading(true);
    try {
      var response = await ProductsService.removeItemFromCart(cartId: cartID);
      return true;
    } finally {
      removeItemFromCartLoading(false);
    }
  }
}
