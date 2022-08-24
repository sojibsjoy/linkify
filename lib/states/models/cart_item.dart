import 'dart:convert';

List<CartItemModel> cartItemListModelFromJson(String str) =>
    List<CartItemModel>.from(
      json.decode(str).map(
            (x) => CartItemModel.fromJson(x),
          ),
    );

CartItemModel carRequestModelFromJson(String str) =>
    CartItemModel.fromJson(json.decode(str));

String carRequestModelToJson(CartItemModel data) => json.encode(data.toJson());

class CartItemModel {
  CartItemModel({
    this.cartId,
    this.productName,
    required this.productMasterId,
    required this.customerId,
    this.tempId,
    required this.quantity,
    required this.unitPrice,
    this.smallImage,
    this.status,
    required this.productSubSkuId,
    this.currencyId,
    required this.supplierId,
    required this.storeId,
    this.serviceDateTime,
    this.serviceTimeString,
    this.isService,
    this.eventId,
    this.inputFieldValueRequestModels,
  });

  int? cartId;
  String? productName;
  int productMasterId;
  int customerId;
  String? tempId;
  double quantity;
  double unitPrice;
  String? smallImage;
  String? status;
  int productSubSkuId;
  int? currencyId;
  int supplierId;
  int storeId;
  String? serviceDateTime;
  String? serviceTimeString;
  bool? isService;
  int? eventId;
  List<InputFieldValueRequestModel>? inputFieldValueRequestModels;

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        cartId: json["cartId"] ?? 0,
        productMasterId: json["productMasterId"],
        productName: json["productName"] ?? '',
        // using customer id in tempId while storeing the item
        customerId: json["customerId"] ?? int.parse(json["tempId"]),
        tempId: json["tempId"],
        quantity: json["quantity"],
        unitPrice: json["unitPrice"] ?? json["price"],
        smallImage: json["smallImage"] ?? '',
        status: json["status"] ?? '',
        productSubSkuId: json["productSubSKUId"],
        currencyId: json["currencyId"] ?? 1,
        supplierId: json["supplierId"],
        storeId: json["storeId"],
        serviceDateTime: json["serviceDateTime"] ?? '',
        serviceTimeString: json["serviceTimeString"] ?? '',
        isService: json["isService"] ?? false,
        eventId: json["eventId"] ?? 0,
        inputFieldValueRequestModels: [], // NOT USING THIS YET
      );

  Map<String, dynamic> toJson() => {
        "cartId": 0, // you must set cartId zero to add it in the cart
        "productMasterId": productMasterId,
        "customerId": customerId,
        "tempId": customerId.toString(),
        "quantity": quantity,
        "unitPrice": unitPrice,
        "status": 'Active',
        "productSubSKUId": productSubSkuId,
        "currencyId": 1,
        "supplierId": supplierId,
        "storeId": storeId,
        "serviceDateTime": DateTime.now().toString(),
        "serviceTimeString": DateTime.now().toString(),
        "isService": false,
        "eventId": 0,
        "inputFieldValueRequestModels": [],
      };
}

class InputFieldValueRequestModel {
  InputFieldValueRequestModel({
    required this.inputFieldListId,
    required this.inputFieldValue,
  });

  int inputFieldListId;
  String inputFieldValue;

  factory InputFieldValueRequestModel.fromJson(Map<String, dynamic> json) =>
      InputFieldValueRequestModel(
        inputFieldListId: json["inputFieldListId"],
        inputFieldValue: json["inputFieldValue"],
      );

  Map<String, dynamic> toJson() => {
        "inputFieldListId": inputFieldListId,
        "inputFieldValue": inputFieldValue,
      };
}
