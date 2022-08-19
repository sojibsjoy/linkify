import 'dart:convert';

import 'package:dogventurehq/states/models/category.dart';
import 'package:dogventurehq/states/services/base_client.dart';
import 'package:dogventurehq/states/models/banner.dart';

class HomeService {
  // Banner Function
  static Future<List<BannerModel>> getBanners(String bannerAPI) async {
    var response = await BaseClient.getData(api: bannerAPI);
    List<BannerModel> bannerList = bannerModelFromJson(jsonEncode(response));
    return bannerList;
  }

  // Category Function
  static Future<List<CategoryModel>> getCategories(String categoryAPI) async {
    var response = await BaseClient.getData(api: categoryAPI);
    List<CategoryModel> categoryList =
        categoryModelFromJson(jsonEncode(response));
    return categoryList;
  }
}
