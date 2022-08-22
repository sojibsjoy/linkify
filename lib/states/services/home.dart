import 'dart:convert';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/category.dart';
import 'package:dogventurehq/states/services/base_client.dart';
import 'package:dogventurehq/states/models/banner.dart';

class HomeService {
  // Banner Function
  static Future<List<BannerModel>> getBanners() async {
    var response = await BaseClient.getData(api: ConstantStrings.kBannerAPI);
    List<BannerModel> bannerList = bannerModelFromJson(jsonEncode(response));
    return bannerList;
  }

  // Category Function
  static Future<List<CategoryModel>> getCategories({
    String? subCategoryId,
  }) async {
    var response = await BaseClient.getData(
      api: subCategoryId != null
          ? ConstantStrings.kCategoryAPI + subCategoryId
          : ConstantStrings.kCategoryAPI,
    );
    List<CategoryModel> categoryList =
        categoryModelFromJson(jsonEncode(response));
    return categoryList;
  }
}
