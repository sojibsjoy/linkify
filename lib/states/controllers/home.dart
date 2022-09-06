import 'dart:convert';

import 'package:dogventurehq/states/models/banner.dart';
import 'package:dogventurehq/states/models/category.dart';
import 'package:dogventurehq/states/models/products.dart';
import 'package:dogventurehq/states/services/home.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // banner loading
  RxBool bannerLoading = true.obs;
  // category loading
  RxBool categoryLoading = true.obs;
  // sub category loading
  RxBool subCategoryLoading = true.obs;
  // products loading
  RxBool productsLoading = true.obs;

  // Banner list
  var bannerList = <BannerModel>[].obs;
  // Category list
  var categoryList = <CategoryModel>[].obs;
  // sub category list
  var subCategoryList = <CategoryModel>[].obs;
  // product list
  var productList = <ProductModel>[].obs;

  // Banner Function
  void getBanners() async {
    bannerLoading.value = true;
    try {
      var response = await HomeService.getBanners();
      bannerList.value = bannerModelFromJson(jsonEncode(response));
    } finally {
      bannerLoading.value = false;
    }
  }

  // Category Function
  void getCategories() async {
    categoryLoading.value = true;
    try {
      var response = await HomeService.getCategories();
      categoryList.value = categoryModelFromJson(jsonEncode(response));
    } finally {
      categoryLoading.value = false;
    }
  }

  // Sub Category Function
  void getSubCategories(int subCategoryId) async {
    subCategoryLoading.value = true;
    try {
      var response = await HomeService.getCategories(
        subCategoryId: subCategoryId.toString(),
      );
      subCategoryList.value = categoryModelFromJson(jsonEncode(response));
    } finally {
      subCategoryLoading.value = false;
    }
  }

  // Products Function
  void getProducts() async {
    productsLoading.value = true;
    try {
      var response = await HomeService.getProducts();
      productList.value = productsModelFromJson(jsonEncode(response));
    } finally {
      productsLoading.value = false;
    }
  }
}
