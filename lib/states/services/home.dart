import 'dart:convert';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/category.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class HomeService {
  // Banner Function
  static Future<dynamic> getBanners() async {
    var response = await BaseClient.getData(api: ConstantStrings.kBannerAPI);
    return response;
  }

  // Category Function
  static Future<dynamic> getCategories({
    String? subCategoryId,
  }) async {
    var response = await BaseClient.getData(
      api: subCategoryId != null
          ? ConstantStrings.kSubCategoryAPI + subCategoryId
          : ConstantStrings.kCategoryAPI,
    );
    return response;
  }

  static Future<dynamic> getProducts() async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kProductsAPI,
    );
    return response;
  }
}
