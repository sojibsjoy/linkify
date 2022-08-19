import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(
    json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
  BannerModel({
    required this.bannerId,
    required this.title,
    required this.subTitle,
    required this.categoryId,
    required this.largeImage,
    required this.smallImage,
    required this.buttonLink,
    required this.buttonText,
    required this.smallDetails,
    required this.bigDetails,
    required this.slug,
    required this.bannerKey,
    required this.languageId,
  });
  late final int bannerId;
  late final String title;
  late final String subTitle;
  late final int categoryId;
  late final String largeImage;
  late final String smallImage;
  late final String buttonLink;
  late final String buttonText;
  late final String smallDetails;
  late final String bigDetails;
  late final String slug;
  late final String bannerKey;
  late final int languageId;

  BannerModel.fromJson(Map<String, dynamic> json) {
    bannerId = json['bannerId'];
    title = json['title'];
    subTitle = json['subTitle'];
    categoryId = json['categoryId'];
    largeImage = json['largeImage'];
    smallImage = json['smallImage'];
    buttonLink = json['buttonLink'];
    buttonText = json['buttonText'];
    smallDetails = json['smallDetails'];
    bigDetails = json['bigDetails'];
    slug = json['slug'];
    bannerKey = json['bannerKey'];
    languageId = json['languageId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['bannerId'] = bannerId;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['categoryId'] = categoryId;
    data['largeImage'] = largeImage;
    data['smallImage'] = smallImage;
    data['buttonLink'] = buttonLink;
    data['buttonText'] = buttonText;
    data['smallDetails'] = smallDetails;
    data['bigDetails'] = bigDetails;
    data['slug'] = slug;
    data['bannerKey'] = bannerKey;
    data['languageId'] = languageId;
    return data;
  }
}
