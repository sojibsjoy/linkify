import 'dart:convert';

List<ProductModel> productsModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productsModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.productMasterId,
    required this.productName,
    required this.productTypeId,
    required this.productDecimal,
    required this.totalRating,
    required this.totalReview,
    required this.storeId,
    required this.supplierId,
    required this.isWished,
    required this.urlKey,
    required this.metaTitle,
    required this.metaKeyword,
    required this.metaDesceiption,
    required this.guidId,
    required this.productSubSkuRequestModels,
  });
  late final int productMasterId;
  late final String productName;
  late final int productTypeId;
  late final double productDecimal;
  late final double totalRating;
  late final double totalReview;
  late final int storeId;
  late final int supplierId;
  late final bool isWished;
  late final String urlKey;
  late final String metaTitle;
  late final String metaKeyword;
  late final String metaDesceiption;
  late final String guidId;
  late final List<ProductSubSkuRequestModels> productSubSkuRequestModels;

  ProductModel.fromJson(Map<String, dynamic> json) {
    productMasterId = json['productMasterId'];
    productName = json['productName'];
    productTypeId = json['productTypeId'];
    productDecimal = json['productDecimal'];
    totalRating = json['totalRating'];
    totalReview = json['totalReview'];
    storeId = json['storeId'];
    supplierId = json['supplierId'];
    isWished = json['isWished'];
    urlKey = json['urlKey'];
    metaTitle = json['metaTitle'];
    metaKeyword = json['metaKeyword'];
    metaDesceiption = json['metaDesceiption'];
    guidId = json['guidId'];
    productSubSkuRequestModels = List.from(json['productSubSkuRequestModels'])
        .map((e) => ProductSubSkuRequestModels.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productMasterId'] = productMasterId;
    data['productName'] = productName;
    data['productTypeId'] = productTypeId;
    data['productDecimal'] = productDecimal;
    data['totalRating'] = totalRating;
    data['totalReview'] = totalReview;
    data['storeId'] = storeId;
    data['supplierId'] = supplierId;
    data['isWished'] = isWished;
    data['urlKey'] = urlKey;
    data['metaTitle'] = metaTitle;
    data['metaKeyword'] = metaKeyword;
    data['metaDesceiption'] = metaDesceiption;
    data['guidId'] = guidId;
    data['productSubSkuRequestModels'] =
        productSubSkuRequestModels.map((e) => e.toJson()).toList();
    return data;
  }
}

class ProductSubSkuRequestModels {
  ProductSubSkuRequestModels({
    required this.productSubSKUId,
    required this.productMasterId,
    required this.storeId,
    required this.subSKU,
    required this.price,
    required this.quantity,
    required this.attributeCombination,
    required this.attributeSetId,
    required this.largeImage,
    required this.mediumImage,
    required this.smallImage,
    required this.videoEmbade,
    required this.symbol,
  });
  late final int productSubSKUId;
  late final int productMasterId;
  late final int storeId;
  late final String subSKU;
  late final double price;
  late final double quantity;
  late final String attributeCombination;
  late final int attributeSetId;
  late final String largeImage;
  late final String mediumImage;
  late final String smallImage;
  late final String videoEmbade;
  late final String symbol;

  ProductSubSkuRequestModels.fromJson(Map<String, dynamic> json) {
    productSubSKUId = json['productSubSKUId'];
    productMasterId = json['productMasterId'];
    storeId = json['storeId'];
    subSKU = json['subSKU'];
    price = json['price'];
    quantity = json['quantity'];
    attributeCombination = json['attributeCombination'];
    attributeSetId = json['attributeSetId'];
    largeImage = json['largeImage'];
    mediumImage = json['mediumImage'];
    smallImage = json['smallImage'];
    videoEmbade = json['videoEmbade'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['productSubSKUId'] = productSubSKUId;
    data['productMasterId'] = productMasterId;
    data['storeId'] = storeId;
    data['subSKU'] = subSKU;
    data['price'] = price;
    data['quantity'] = quantity;
    data['attributeCombination'] = attributeCombination;
    data['attributeSetId'] = attributeSetId;
    data['largeImage'] = largeImage;
    data['mediumImage'] = mediumImage;
    data['smallImage'] = smallImage;
    data['videoEmbade'] = videoEmbade;
    data['symbol'] = symbol;
    return data;
  }
}
