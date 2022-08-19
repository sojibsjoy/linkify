import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    required this.categoryId,
    required this.name,
    required this.subTitle,
    required this.largeImage,
    required this.mediumImage,
    required this.smallImage,
    required this.level,
    required this.guidId,
    // this.parentId,
    required this.logoClass,
    required this.logoImage,
    required this.isService,
    required this.isPreferenceCategory,
    // this.categoryPreferenceId,
    // this.customerId,
    // this.details,
    // required this.childCategorys,
  });
  late final int categoryId;
  late final String name;
  late final String subTitle;
  late final String largeImage;
  late final String mediumImage;
  late final String smallImage;
  late final int level;
  late final String guidId;
  // late final Null parentId;
  late final String logoClass;
  late final String logoImage;
  late final bool isService;
  late final bool isPreferenceCategory;
  // late final Null categoryPreferenceId;
  // late final Null customerId;
  // late final Null details;
  // late final List<dynamic> childCategorys;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    name = json['name'];
    subTitle = json['subTitle'] ?? '';
    largeImage = json['largeImage'];
    mediumImage = json['mediumImage'];
    smallImage = json['smallImage'];
    level = json['level'];
    guidId = json['guidId'];
    // parentId = null;
    logoClass = json['logoClass'];
    logoImage = json['logoImage'];
    isService = json['isService'];
    isPreferenceCategory = json['isPreferenceCategory'];
    // categoryPreferenceId = null;
    // customerId = null;
    // details = null;
    // childCategorys = List.castFrom<dynamic, dynamic>(json['childCategorys']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['categoryId'] = categoryId;
    data['name'] = name;
    data['subTitle'] = subTitle;
    data['largeImage'] = largeImage;
    data['mediumImage'] = mediumImage;
    data['smallImage'] = smallImage;
    data['level'] = level;
    data['guidId'] = guidId;
    // data['parentId'] = parentId;
    data['logoClass'] = logoClass;
    data['logoImage'] = logoImage;
    data['isService'] = isService;
    data['isPreferenceCategory'] = isPreferenceCategory;
    // data['categoryPreferenceId'] = categoryPreferenceId;
    // data['customerId'] = customerId;
    // data['details'] = details;
    // data['childCategorys'] = childCategorys;
    return data;
  }
}
