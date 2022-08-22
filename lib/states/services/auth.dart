import 'dart:convert';

import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/models/category.dart';
import 'package:dogventurehq/states/models/register.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class AuthService {
  // Registration Function
  static Future<void> register(RegisterModel rModel) async {
    print(rModel.toJson());
    // var response = await BaseClient.postData(
    //   api: ConstantStrings.kRegisterAPI,
    //   body: rModel.toJson(),
    // );

    return;
  }

  // Login Function
  static Future<List<CategoryModel>> getCategories() async {
    var response = await BaseClient.getData(api: ConstantStrings.kCategoryAPI);
    List<CategoryModel> categoryList =
        categoryModelFromJson(jsonEncode(response));
    return categoryList;
  }
}
