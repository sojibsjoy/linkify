import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) =>
    ProductDetailsModel.fromJson(json.decode(str));

class ProductDetailsModel {
  ProductDetailsModel({
    required this.productMasterId,
    required this.productName,
    required this.guidId,
    required this.description,
    required this.shortDescription,
    required this.storeId,
    required this.productType,
    required this.totalRating,
    required this.totalReview,
    required this.productMasterMediaViewModels,
    required this.brandRequestModel,
    required this.supplierRequestModel,
    required this.productDetailsRequestModel,
    required this.categoryRequestModels,
    required this.productSubSkuRequestModels,
    required this.attributeRequestModels,
  });

  int productMasterId;
  String productName;
  String guidId;
  String description;
  String shortDescription;
  int storeId;
  String productType;
  double totalRating;
  double totalReview;
  List<ProductMasterMediaViewModel> productMasterMediaViewModels;
  BrandRequestModel brandRequestModel;
  SupplierRequestModel supplierRequestModel;
  ProductDetailsRequestModel productDetailsRequestModel;
  List<CategoryRequestModel> categoryRequestModels;
  List<ProductSubSkuRequestModel> productSubSkuRequestModels;
  List<AttributeRequestModel> attributeRequestModels;

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        productMasterId: json["productMasterId"],
        productName: json["productName"],
        guidId: json["guidId"],
        description: json["description"],
        shortDescription: json["shortDescription"],
        storeId: json["storeId"],
        productType: json["productType"],
        totalRating: json["totalRating"],
        totalReview: json["totalReview"],
        productMasterMediaViewModels: List<ProductMasterMediaViewModel>.from(
            json["productMasterMediaViewModels"]
                .map((x) => ProductMasterMediaViewModel.fromJson(x))),
        brandRequestModel:
            BrandRequestModel.fromJson(json["brandRequestModel"]),
        supplierRequestModel:
            SupplierRequestModel.fromJson(json["supplierRequestModel"]),
        productDetailsRequestModel: ProductDetailsRequestModel.fromJson(
            json["productDetailsRequestModel"]),
        categoryRequestModels: List<CategoryRequestModel>.from(
            json["categoryRequestModels"]
                .map((x) => CategoryRequestModel.fromJson(x))),
        productSubSkuRequestModels: List<ProductSubSkuRequestModel>.from(
            json["productSubSkuRequestModels"]
                .map((x) => ProductSubSkuRequestModel.fromJson(x))),
        attributeRequestModels: List<AttributeRequestModel>.from(
            json["attributeRequestModels"]
                .map((x) => AttributeRequestModel.fromJson(x))),
      );
}

class AttributeRequestModel {
  AttributeRequestModel({
    required this.attributeId,
    required this.attributeTitle,
    required this.skuInitials,
    required this.attributeDetailsRequestModels,
  });

  int attributeId;
  String attributeTitle;
  String skuInitials;
  List<AttributeDetailsRequestModel> attributeDetailsRequestModels;

  factory AttributeRequestModel.fromJson(Map<String, dynamic> json) =>
      AttributeRequestModel(
        attributeId: json["attributeId"],
        attributeTitle: json["attributeTitle"],
        skuInitials: json["skuInitials"],
        attributeDetailsRequestModels: List<AttributeDetailsRequestModel>.from(
            json["attributeDetailsRequestModels"]
                .map((x) => AttributeDetailsRequestModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "attributeId": attributeId,
        "attributeTitle": attributeTitle,
        "skuInitials": skuInitials,
        "attributeDetailsRequestModels": List<dynamic>.from(
            attributeDetailsRequestModels.map((x) => x.toJson())),
      };
}

class AttributeDetailsRequestModel {
  AttributeDetailsRequestModel({
    required this.attributeId,
    required this.value,
  });

  int attributeId;
  String value;

  factory AttributeDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      AttributeDetailsRequestModel(
        attributeId: json["attributeId"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "attributeId": attributeId,
        "value": value,
      };
}

class BrandRequestModel {
  BrandRequestModel({
    required this.brandId,
    required this.title,
  });

  int brandId;
  String title;

  factory BrandRequestModel.fromJson(Map<String, dynamic> json) =>
      BrandRequestModel(
        brandId: json["brandId"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "brandId": brandId,
        "title": title,
      };
}

class CategoryRequestModel {
  CategoryRequestModel({
    required this.productCategoryId,
    required this.productMasterId,
    required this.categoryId,
    required this.categoryName,
  });

  int productCategoryId;
  int productMasterId;
  int categoryId;
  String categoryName;

  factory CategoryRequestModel.fromJson(Map<String, dynamic> json) =>
      CategoryRequestModel(
        productCategoryId: json["productCategoryId"],
        productMasterId: json["productMasterId"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
      );

  Map<String, dynamic> toJson() => {
        "productCategoryId": productCategoryId,
        "productMasterId": productMasterId,
        "categoryId": categoryId,
        "categoryName": categoryName,
      };
}

class InputFieldListRequestModel {
  InputFieldListRequestModel({
    required this.inputFieldListId,
    required this.listName,
    required this.inputFieldRequestModels,
  });

  int inputFieldListId;
  dynamic listName;
  List<dynamic> inputFieldRequestModels;

  factory InputFieldListRequestModel.fromJson(Map<String, dynamic> json) =>
      InputFieldListRequestModel(
        inputFieldListId: json["inputFieldListId"],
        listName: json["listName"],
        inputFieldRequestModels:
            List<dynamic>.from(json["inputFieldRequestModels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "inputFieldListId": inputFieldListId,
        "listName": listName,
        "inputFieldRequestModels":
            List<dynamic>.from(inputFieldRequestModels.map((x) => x)),
      };
}

class ProductDetailsRequestModel {
  ProductDetailsRequestModel({
    required this.productDetailsId,
    required this.productMasterId,
    required this.sku,
    required this.stockAvailability,
  });

  int productDetailsId;
  int productMasterId;
  String sku;
  // dynamic weight;
  int stockAvailability;

  factory ProductDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsRequestModel(
        productDetailsId: json["productDetailsId"],
        productMasterId: json["productMasterId"],
        sku: json["sku"],
        stockAvailability: json["stockAvailability"],
      );

  Map<String, dynamic> toJson() => {
        "productDetailsId": productDetailsId,
        "productMasterId": productMasterId,
        "sku": sku,
        "stockAvailability": stockAvailability,
      };
}

class ProductMasterMediaViewModel {
  ProductMasterMediaViewModel({
    required this.productMasterMediaId,
    required this.productMasterId,
    required this.fileLocation,
    required this.mediumImage,
    required this.smallImage,
  });

  int productMasterMediaId;
  int productMasterId;
  String fileLocation;
  String mediumImage;
  String smallImage;

  factory ProductMasterMediaViewModel.fromJson(Map<String, dynamic> json) =>
      ProductMasterMediaViewModel(
        productMasterMediaId: json["productMasterMediaId"],
        productMasterId: json["productMasterId"],
        fileLocation: json["fileLocation"],
        mediumImage: json["mediumImage"],
        smallImage: json["smallImage"],
      );

  Map<String, dynamic> toJson() => {
        "productMasterMediaId": productMasterMediaId,
        "productMasterId": productMasterId,
        "fileLocation": fileLocation,
        "mediumImage": mediumImage,
        "smallImage": smallImage,
      };
}

class ProductSubSkuRequestModel {
  ProductSubSkuRequestModel({
    required this.productSubSkuId,
    required this.productMasterId,
    required this.subSku,
    required this.price,
    required this.quantity,
    required this.attributeCombination,
    required this.attributeSetId,
  });

  int productSubSkuId;
  int productMasterId;
  String subSku;
  double price;
  double quantity;
  String attributeCombination;
  int attributeSetId;

  factory ProductSubSkuRequestModel.fromJson(Map<String, dynamic> json) =>
      ProductSubSkuRequestModel(
        productSubSkuId: json["productSubSKUId"],
        productMasterId: json["productMasterId"],
        subSku: json["subSKU"],
        price: json["price"],
        quantity: json["quantity"],
        attributeCombination: json["attributeCombination"],
        attributeSetId: json["attributeSetId"],
      );
}

class ProductSubSkuDetailsRequestModel {
  ProductSubSkuDetailsRequestModel({
    required this.productSubSkuDetailsId,
    required this.productSubSkuId,
    required this.attributeDetailId,
  });

  int productSubSkuDetailsId;
  int productSubSkuId;
  int attributeDetailId;

  factory ProductSubSkuDetailsRequestModel.fromJson(
          Map<String, dynamic> json) =>
      ProductSubSkuDetailsRequestModel(
        productSubSkuDetailsId: json["productSubSKUDetailsId"],
        productSubSkuId: json["productSubSKUId"],
        attributeDetailId: json["attributeDetailId"],
      );

  Map<String, dynamic> toJson() => {
        "productSubSKUDetailsId": productSubSkuDetailsId,
        "productSubSKUId": productSubSkuId,
        "attributeDetailId": attributeDetailId,
      };
}

class SupplierRequestModel {
  SupplierRequestModel({
    required this.supplierId,
    required this.supplierName,
  });

  int supplierId;
  String supplierName;

  factory SupplierRequestModel.fromJson(Map<String, dynamic> json) =>
      SupplierRequestModel(
        supplierId: json["supplierId"],
        supplierName: json["supplierName"],
      );

  Map<String, dynamic> toJson() => {
        "supplierId": supplierId,
        "supplierName": supplierName,
      };
}
