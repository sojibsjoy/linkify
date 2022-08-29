import 'dart:convert';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    this.invoiceMasterId,
    required this.customerId,
    this.refNumber,
    // required this.invoiceDate,
    required this.totalAmount,
    required this.receivedAmt,
    // required this.courierCharge,
    // required this.carryingCost,
    // required this.paymentMethod,
    // required this.remark,
    // required this.discountCode,
    // required this.discountValue,
    // required this.paymentStatus,
    // required this.status,
    // required this.createdAt,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    this.invoiceStatusId,
    // required this.supplierId,
    // required this.eventId,
    required this.invoiceRequestModels,
    required this.paymentRequestModels,
    required this.billingShippingAddressRequestModels,
    this.inputFieldValueRequestModels,
    // required this.orderFrom,
    // required this.orderSource,
  });
  int? invoiceMasterId;
  int customerId;
  String? refNumber;
  // DateTime invoiceDate;
  double totalAmount;
  double receivedAmt;
  // int courierCharge;
  // int carryingCost;
  // int paymentMethod;
  // String remark;
  // String discountCode;
  // int discountValue;
  // int paymentStatus;
  // String status;
  // DateTime createdAt;
  int countryId;
  int stateId;
  int cityId;
  int? invoiceStatusId;
  // int supplierId;
  // int eventId;
  List<InvoiceRequestModel> invoiceRequestModels;
  List<PaymentRequestModel> paymentRequestModels;
  List<BillingShippingAddressRequestModel> billingShippingAddressRequestModels;
  List<InputFieldValueRequestModel>? inputFieldValueRequestModels;
  // String orderFrom;
  // String orderSource;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        invoiceMasterId: json["invoiceMasterId"],
        customerId: json["customerId"],
        refNumber: json["refNumber"] ?? "string",
        // invoiceDate: DateTime.parse(json["invoiceDate"]),
        totalAmount: json["totalAmount"],
        receivedAmt: json["receivedAmt"],
        // courierCharge: json["courierCharge"],
        // carryingCost: json["carryingCost"],
        // paymentMethod: json["paymentMethod"],
        // remark: json["remark"],
        // discountCode: json["discountCode"],
        // discountValue: json["discountValue"],
        // paymentStatus: json["paymentStatus"],
        // status: json["status"],
        // createdAt: DateTime.parse(json["createdAt"]),
        countryId: json["countryId"] ?? 0,
        stateId: json["stateId"] ?? 0,
        cityId: json["cityId"] ?? 0,
        invoiceStatusId: json["invoiceStatusId"] ?? 1,
        // supplierId: json["supplierId"],
        // eventId: json["eventId"],
        invoiceRequestModels: List<InvoiceRequestModel>.from(
            json["invoiceRequestModels"]
                .map((x) => InvoiceRequestModel.fromJson(x))),
        paymentRequestModels: List<PaymentRequestModel>.from(
            json["paymentRequestModels"]
                .map((x) => PaymentRequestModel.fromJson(x))),
        billingShippingAddressRequestModels:
            List<BillingShippingAddressRequestModel>.from(
                json["billingShippingAddressRequestModels"].map(
                    (x) => BillingShippingAddressRequestModel.fromJson(x))),
        inputFieldValueRequestModels: List<InputFieldValueRequestModel>.from(
            json["inputFieldValueRequestModels"]
                .map((x) => InputFieldValueRequestModel.fromJson(x))),
        // orderFrom: json["orderFrom"],
        // orderSource: json["orderSource"],
      );

  Map<String, dynamic> toJson() => {
        "invoiceMasterId": 0,
        "customerId": customerId,
        "refNumber": "string",
        // "invoiceDate": invoiceDate.toIso8601String(),
        "totalAmount": totalAmount,
        "receivedAmt": receivedAmt,
        "courierCharge": 0,
        "carryingCost": 0,
        "paymentMethod": 0,
        "remark": "string",
        "discountCode": 0,
        "discountValue": 0,
        "paymentStatus": 0,
        "status": "string",
        // "createdAt": createdAt.toIso8601String(),
        "countryId": countryId,
        "stateId": stateId,
        "cityId": cityId,
        "invoiceStatusId": 1,
        // "supplierId": supplierId,
        // "eventId": eventId,
        "invoiceRequestModels":
            List<dynamic>.from(invoiceRequestModels.map((x) => x.toJson())),
        "paymentRequestModels":
            List<dynamic>.from(paymentRequestModels.map((x) => x.toJson())),
        "billingShippingAddressRequestModels": List<dynamic>.from(
            billingShippingAddressRequestModels.map((x) => x.toJson())),
        "inputFieldValueRequestModels": [],
        "orderFrom": "App",
        "orderSource": "App",
      };
}

class BillingShippingAddressRequestModel {
  BillingShippingAddressRequestModel({
    this.billingShippingAddressId,
    this.invoiceMasterId,
    required this.customerId,
    required this.customerAddressId,
  });

  int? billingShippingAddressId;
  int? invoiceMasterId;
  int customerId;
  // DateTime deleveryTime;
  // bool isShippingAddress;
  int customerAddressId;

  factory BillingShippingAddressRequestModel.fromJson(
          Map<String, dynamic> json) =>
      BillingShippingAddressRequestModel(
        billingShippingAddressId: json["billingShippingAddressId"],
        invoiceMasterId: json["invoiceMasterId"],
        customerId: json["customerId"],
        customerAddressId: json["customerAddressId"],
      );

  Map<String, dynamic> toJson() => {
        "billingShippingAddressId": 0,
        "invoiceMasterId": 0,
        "customerId": customerId,
        // "deleveryTime": deleveryTime.toIso8601String(),
        // "isShippingAddress": isShippingAddress,
        "customerAddressId": customerAddressId,
      };
}

class InputFieldValueRequestModel {
  InputFieldValueRequestModel({
    required this.invoiceInputFieldValueId,
    required this.invoiceId,
    required this.inputFieldListId,
    required this.inputFieldValue,
  });

  int invoiceInputFieldValueId;
  int invoiceId;
  int inputFieldListId;
  String inputFieldValue;

  factory InputFieldValueRequestModel.fromJson(Map<String, dynamic> json) =>
      InputFieldValueRequestModel(
        invoiceInputFieldValueId: json["invoiceInputFieldValueId"],
        invoiceId: json["invoiceId"],
        inputFieldListId: json["inputFieldListId"],
        inputFieldValue: json["inputFieldValue"],
      );

  Map<String, dynamic> toJson() => {
        "invoiceInputFieldValueId": invoiceInputFieldValueId,
        "invoiceId": invoiceId,
        "inputFieldListId": inputFieldListId,
        "inputFieldValue": inputFieldValue,
      };
}

class InvoiceRequestModel {
  InvoiceRequestModel({
    // required this.invoiceId,
    // required this.invoiceMasterId,
    // required this.refNumber,
    // required this.invoiceDate,
    required this.totalAmount,
    required this.receivedAmt,
    // required this.carryingCost,
    // required this.courierCharge,
    // required this.paymentMethod,
    // required this.paymentStatus,
    // required this.remark,
    // required this.discountCode,
    // required this.discountValue,
    required this.storeId,
    // required this.status,
    // required this.createdAt,
    required this.supplierId,
    // required this.supplierName,
    // required this.shopName,
    // required this.invoiceStatusId,
    // required this.amountToSupplier,
    // required this.amountToAdmin,
    // required this.supplierCommissionId,
    // required this.isService,
    // required this.shopLogo,
    // required this.isDigitalProduct,
    // required this.isQuotationProduct,
    // required this.serviceDate,
    // required this.serviceDateTime,
    // required this.serviceTime,
    // required this.serviceTimeString,
    // required this.parentInvoiceId,
    // required this.ticketBuyForCustomerId,
    // required this.customerId,
    required this.invoiceDetailsRequestModels,
    // required this.invoiceDetailsViewModels,
  });

  // int invoiceId;
  // int invoiceMasterId;
  double totalAmount;
  double receivedAmt;
  int storeId;
  int supplierId;
  List<InvoiceDetailsRequestModel> invoiceDetailsRequestModels;
  // List<InvoiceDetailsViewModel> invoiceDetailsViewModels;

  factory InvoiceRequestModel.fromJson(Map<String, dynamic> json) =>
      InvoiceRequestModel(
        // invoiceId: json["invoiceId"],
        // invoiceMasterId: json["invoiceMasterId"],
        // refNumber: json["refNumber"],
        // invoiceDate: DateTime.parse(json["invoiceDate"]),
        totalAmount: json["totalAmount"],
        receivedAmt: json["receivedAmt"],
        // carryingCost: json["carryingCost"],
        // courierCharge: json["courierCharge"],
        // paymentMethod: json["paymentMethod"],
        // paymentStatus: json["paymentStatus"],
        // remark: json["remark"],
        // discountCode: json["discountCode"],
        // discountValue: json["discountValue"],
        storeId: json["storeId"],
        // status: json["status"],
        // createdAt: DateTime.parse(json["createdAt"]),
        supplierId: json["supplierId"],
        // supplierName: json["supplierName"],
        // shopName: json["shopName"],
        // invoiceStatusId: json["invoiceStatusId"],
        // amountToSupplier: json["amountToSupplier"],
        // amountToAdmin: json["amountToAdmin"],
        // supplierCommissionId: json["supplierCommissionId"],
        // isService: json["isService"],
        // shopLogo: json["shopLogo"],
        // isDigitalProduct: json["isDigitalProduct"],
        // isQuotationProduct: json["isQuotationProduct"],
        // serviceDate: DateTime.parse(json["serviceDate"]),
        // serviceDateTime: DateTime.parse(json["serviceDateTime"]),
        // serviceTime: DateTime.parse(json["serviceTime"]),
        // serviceTimeString: json["serviceTimeString"],
        // parentInvoiceId: json["parentInvoiceId"],
        // ticketBuyForCustomerId: json["ticketBuyForCustomerId"],
        // customerId: json["customerId"],
        invoiceDetailsRequestModels: List<InvoiceDetailsRequestModel>.from(
            json["invoiceDetailsRequestModels"]
                .map((x) => InvoiceDetailsRequestModel.fromJson(x))),
        // invoiceDetailsViewModels: List<InvoiceDetailsViewModel>.from(
        //     json["invoiceDetailsViewModels"]
        //         .map((x) => InvoiceDetailsViewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        // "invoiceId": 0,
        // "invoiceMasterId": 0,
        // "refNumber": refNumber,
        // "invoiceDate": invoiceDate.toIso8601String(),
        "totalAmount": totalAmount,
        "receivedAmt": receivedAmt,
        "carryingCost": 0,
        "courierCharge": 0,
        "paymentMethod": 1,
        "paymentStatus": 0,
        // "remark": remark,
        // "discountCode": 0,
        "discountValue": 0,
        "storeId": storeId,
        // "status": status,
        // "createdAt": createdAt.toIso8601String(),
        "supplierId": supplierId,
        // "supplierName": supplierName,
        // "shopName": shopName,
        // "invoiceStatusId": invoiceStatusId,
        // "amountToSupplier": amountToSupplier,
        // "amountToAdmin": amountToAdmin,
        "supplierCommissionId": 0,
        "isService": false,
        // "shopLogo": shopLogo,
        "isDigitalProduct": false,
        "isQuotationProduct": false,
        // "serviceDate": serviceDate.toIso8601String(),
        // "serviceDateTime": serviceDateTime.toIso8601String(),
        // "serviceTime": serviceTime.toIso8601String(),
        // "serviceTimeString": serviceTimeString,
        // "parentInvoiceId": parentInvoiceId,
        // "ticketBuyForCustomerId": ticketBuyForCustomerId,
        // "customerId": customerId,
        "invoiceDetailsRequestModels": List<dynamic>.from(
            invoiceDetailsRequestModels.map((x) => x.toJson())),
        // "invoiceDetailsViewModels":
        //     List<dynamic>.from(invoiceDetailsViewModels.map((x) => x.toJson())),
      };
}

class InvoiceDetailsRequestModel {
  InvoiceDetailsRequestModel({
    // required this.invoiceDetailsId,
    // required this.invoiceId,
    required this.productMasterId,
    required this.quantity,
    required this.price,
    // required this.status,
    // required this.createdAt,
    required this.productSubSkuId,
    // required this.qrCodeNo,
    // required this.pdfUrl,
    // required this.qrCodeImage,
  });

  // int invoiceDetailsId;
  // int invoiceId;
  int productMasterId;
  double quantity;
  double price;
  // String status;
  // DateTime createdAt;
  int productSubSkuId;
  // String qrCodeNo;
  // String pdfUrl;
  // String qrCodeImage;

  factory InvoiceDetailsRequestModel.fromJson(Map<String, dynamic> json) =>
      InvoiceDetailsRequestModel(
        // invoiceDetailsId: json["invoiceDetailsId"],
        // invoiceId: json["invoiceId"],
        productMasterId: json["productMasterId"],
        quantity: json["quantity"],
        price: json["price"],
        // status: json["status"],
        // createdAt: DateTime.parse(json["createdAt"]),
        productSubSkuId: json["productSubSKUId"],
        // qrCodeNo: json["qrCodeNo"],
        // pdfUrl: json["pdfUrl"],
        // qrCodeImage: json["qrCodeImage"],
      );

  Map<String, dynamic> toJson() => {
        // "invoiceDetailsId": invoiceDetailsId,
        // "invoiceId": invoiceId,
        "productMasterId": productMasterId,
        "quantity": quantity,
        "price": price,
        // "status": status,
        // "createdAt": createdAt.toIso8601String(),
        "productSubSKUId": productSubSkuId,
        // "qrCodeNo": qrCodeNo,
        // "pdfUrl": pdfUrl,
        // "qrCodeImage": qrCodeImage,
      };
}

/*

class InvoiceDetailsViewModel {
  InvoiceDetailsViewModel({
    required this.invoiceDetailsId,
    required this.invoiceId,
    required this.productMasterId,
    required this.quantity,
    required this.price,
    required this.status,
    required this.createdAt,
    required this.productTypeId,
    required this.storeId,
    required this.supplierId,
    required this.supplierName,
    required this.supplierMobile,
    required this.productName,
    required this.invoiceMasterId,
    required this.productSkuId,
    required this.subSku,
    required this.largeImage,
    required this.mediumImage,
    required this.smallImage,
    required this.fileLocation,
    required this.digitalProductGuid,
    required this.digitalProductUrl,
    required this.serviceDate,
    required this.qrCodeNo,
    required this.pdfUrl,
    required this.qrCodeImage,
    required this.brandName,
    required this.productSubSkuViewModels,
  });

  int invoiceDetailsId;
  int invoiceId;
  int productMasterId;
  int quantity;
  int price;
  String status;
  DateTime createdAt;
  int productTypeId;
  int storeId;
  int supplierId;
  String supplierName;
  String supplierMobile;
  String productName;
  int invoiceMasterId;
  int productSkuId;
  String subSku;
  String largeImage;
  String mediumImage;
  String smallImage;
  String fileLocation;
  String digitalProductGuid;
  String digitalProductUrl;
  DateTime serviceDate;
  String qrCodeNo;
  String pdfUrl;
  String qrCodeImage;
  String brandName;
  List<ProductSubSkuViewModel> productSubSkuViewModels;

  factory InvoiceDetailsViewModel.fromJson(Map<String, dynamic> json) =>
      InvoiceDetailsViewModel(
        invoiceDetailsId: json["invoiceDetailsId"],
        invoiceId: json["invoiceId"],
        productMasterId: json["productMasterId"],
        quantity: json["quantity"],
        price: json["price"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        productTypeId: json["productTypeId"],
        storeId: json["storeId"],
        supplierId: json["supplierId"],
        supplierName: json["supplierName"],
        supplierMobile: json["supplierMobile"],
        productName: json["productName"],
        invoiceMasterId: json["invoiceMasterId"],
        productSkuId: json["productSkuId"],
        subSku: json["subSku"],
        largeImage: json["largeImage"],
        mediumImage: json["mediumImage"],
        smallImage: json["smallImage"],
        fileLocation: json["fileLocation"],
        digitalProductGuid: json["digitalProductGuid"],
        digitalProductUrl: json["digitalProductUrl"],
        serviceDate: DateTime.parse(json["serviceDate"]),
        qrCodeNo: json["qrCodeNo"],
        pdfUrl: json["pdfUrl"],
        qrCodeImage: json["qrCodeImage"],
        brandName: json["brandName"],
        productSubSkuViewModels: List<ProductSubSkuViewModel>.from(
            json["productSubSKUViewModels"]
                .map((x) => ProductSubSkuViewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "invoiceDetailsId": invoiceDetailsId,
        "invoiceId": invoiceId,
        "productMasterId": productMasterId,
        "quantity": quantity,
        "price": price,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "productTypeId": productTypeId,
        "storeId": storeId,
        "supplierId": supplierId,
        "supplierName": supplierName,
        "supplierMobile": supplierMobile,
        "productName": productName,
        "invoiceMasterId": invoiceMasterId,
        "productSkuId": productSkuId,
        "subSku": subSku,
        "largeImage": largeImage,
        "mediumImage": mediumImage,
        "smallImage": smallImage,
        "fileLocation": fileLocation,
        "digitalProductGuid": digitalProductGuid,
        "digitalProductUrl": digitalProductUrl,
        "serviceDate": serviceDate.toIso8601String(),
        "qrCodeNo": qrCodeNo,
        "pdfUrl": pdfUrl,
        "qrCodeImage": qrCodeImage,
        "brandName": brandName,
        "productSubSKUViewModels":
            List<dynamic>.from(productSubSkuViewModels.map((x) => x.toJson())),
      };
}

class ProductSubSkuViewModel {
  ProductSubSkuViewModel({
    required this.productSubSkuId,
    required this.productMasterId,
    required this.subSku,
    required this.price,
    required this.quantity,
    required this.barcode,
    required this.status,
    required this.createBy,
    required this.createDate,
    required this.skuImage,
    required this.attributeCombination,
    required this.productAttributeDetailsId,
    required this.isDelete,
    required this.attributesIds,
    required this.attributeSetId,
    required this.largeImage,
    required this.mediumImage,
    required this.smallImage,
    required this.videoEmbade,
    required this.productDetailsId,
    required this.wareHouseProductMasterInfoId,
    required this.wareHouseId,
    required this.wareHouseAttributeDetailId,
    required this.wareHouseShelfAttributeDetailId,
    required this.wareHouseShelfRowAttributeDetailId,
    required this.wareHouseShelfColumnAttributeDetailId,
    required this.purchaseRate,
    required this.saleRate,
    required this.productSubSkuDetailsViewModels,
  });

  int productSubSkuId;
  int productMasterId;
  String subSku;
  int price;
  int quantity;
  String barcode;
  String status;
  int createBy;
  DateTime createDate;
  String skuImage;
  String attributeCombination;
  int productAttributeDetailsId;
  bool isDelete;
  String attributesIds;
  int attributeSetId;
  String largeImage;
  String mediumImage;
  String smallImage;
  String videoEmbade;
  int productDetailsId;
  int wareHouseProductMasterInfoId;
  int wareHouseId;
  int wareHouseAttributeDetailId;
  int wareHouseShelfAttributeDetailId;
  int wareHouseShelfRowAttributeDetailId;
  int wareHouseShelfColumnAttributeDetailId;
  int purchaseRate;
  int saleRate;
  List<ProductSubSkuDetailsViewModel> productSubSkuDetailsViewModels;

  factory ProductSubSkuViewModel.fromJson(Map<String, dynamic> json) =>
      ProductSubSkuViewModel(
        productSubSkuId: json["productSubSKUId"],
        productMasterId: json["productMasterId"],
        subSku: json["subSKU"],
        price: json["price"],
        quantity: json["quantity"],
        barcode: json["barcode"],
        status: json["status"],
        createBy: json["createBy"],
        createDate: DateTime.parse(json["createDate"]),
        skuImage: json["skuImage"],
        attributeCombination: json["attributeCombination"],
        productAttributeDetailsId: json["productAttributeDetailsId"],
        isDelete: json["isDelete"],
        attributesIds: json["attributesIds"],
        attributeSetId: json["attributeSetId"],
        largeImage: json["largeImage"],
        mediumImage: json["mediumImage"],
        smallImage: json["smallImage"],
        videoEmbade: json["videoEmbade"],
        productDetailsId: json["productDetailsId"],
        wareHouseProductMasterInfoId: json["wareHouseProductMasterInfoId"],
        wareHouseId: json["wareHouseId"],
        wareHouseAttributeDetailId: json["wareHouseAttributeDetailId"],
        wareHouseShelfAttributeDetailId:
            json["wareHouseShelfAttributeDetailId"],
        wareHouseShelfRowAttributeDetailId:
            json["wareHouseShelfRowAttributeDetailId"],
        wareHouseShelfColumnAttributeDetailId:
            json["wareHouseShelfColumnAttributeDetailId"],
        purchaseRate: json["purchaseRate"],
        saleRate: json["saleRate"],
        productSubSkuDetailsViewModels:
            List<ProductSubSkuDetailsViewModel>.from(
                json["productSubSkuDetailsViewModels"]
                    .map((x) => ProductSubSkuDetailsViewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productSubSKUId": productSubSkuId,
        "productMasterId": productMasterId,
        "subSKU": subSku,
        "price": price,
        "quantity": quantity,
        "barcode": barcode,
        "status": status,
        "createBy": createBy,
        "createDate": createDate.toIso8601String(),
        "skuImage": skuImage,
        "attributeCombination": attributeCombination,
        "productAttributeDetailsId": productAttributeDetailsId,
        "isDelete": isDelete,
        "attributesIds": attributesIds,
        "attributeSetId": attributeSetId,
        "largeImage": largeImage,
        "mediumImage": mediumImage,
        "smallImage": smallImage,
        "videoEmbade": videoEmbade,
        "productDetailsId": productDetailsId,
        "wareHouseProductMasterInfoId": wareHouseProductMasterInfoId,
        "wareHouseId": wareHouseId,
        "wareHouseAttributeDetailId": wareHouseAttributeDetailId,
        "wareHouseShelfAttributeDetailId": wareHouseShelfAttributeDetailId,
        "wareHouseShelfRowAttributeDetailId":
            wareHouseShelfRowAttributeDetailId,
        "wareHouseShelfColumnAttributeDetailId":
            wareHouseShelfColumnAttributeDetailId,
        "purchaseRate": purchaseRate,
        "saleRate": saleRate,
        "productSubSkuDetailsViewModels": List<dynamic>.from(
            productSubSkuDetailsViewModels.map((x) => x.toJson())),
      };
}

class ProductSubSkuDetailsViewModel {
  ProductSubSkuDetailsViewModel({
    required this.productSubSkuDetailsId,
    required this.productSubSkuId,
    required this.attributeDetailId,
  });

  int productSubSkuDetailsId;
  int productSubSkuId;
  int attributeDetailId;

  factory ProductSubSkuDetailsViewModel.fromJson(Map<String, dynamic> json) =>
      ProductSubSkuDetailsViewModel(
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

*/

class PaymentRequestModel {
  PaymentRequestModel({
    // required this.paymentId,
    // required this.invoiceMasterId,
    // required this.currencyId,
    // required this.amount,
    // required this.courierCharge,
    // required this.discountAmount,
    // required this.carryingCost,
    this.paymentMethod,
    // required this.courierAgencyId,
    // required this.payDate,
    // required this.note,
    // required this.transactionNo,
    // required this.status,
    // required this.createdAt,
    // required this.couponId,
  });

  // int paymentId;
  // int invoiceMasterId;
  // int currencyId;
  // int amount;
  // int courierCharge;
  // int discountAmount;
  // int carryingCost;
  int? paymentMethod;
  // int courierAgencyId;
  // DateTime payDate;
  // String note;
  // String transactionNo;
  // String status;
  // DateTime createdAt;
  // int couponId;

  factory PaymentRequestModel.fromJson(Map<String, dynamic> json) =>
      PaymentRequestModel(
        // paymentId: json["paymentId"],
        // invoiceMasterId: json["invoiceMasterId"],
        // currencyId: json["currencyId"],
        // amount: json["amount"],
        // courierCharge: json["courierCharge"],
        // discountAmount: json["discountAmount"],
        // carryingCost: json["carryingCost"],
        paymentMethod: json["paymentMethod"] ?? 1,
        // courierAgencyId: json["courierAgencyId"],
        // payDate: DateTime.parse(json["payDate"]),
        // note: json["note"],
        // transactionNo: json["transactionNo"],
        // status: json["status"],
        // createdAt: DateTime.parse(json["createdAt"]),
        // couponId: json["couponId"],
      );

  Map<String, dynamic> toJson() => {
        "paymentId": 0,
        "invoiceMasterId": 0,
        "currencyId": 1,
        "amount": 0,
        "courierCharge": 0,
        "discountAmount": 0,
        "carryingCost": 0,
        "paymentMethod": 1,
        "courierAgencyId": 0,
        // "payDate": payDate.toIso8601String(),
        "note": "string",
        "transactionNo": "string",
        "status": "string",
        // "createdAt": createdAt.toIso8601String(),
        // "couponId": couponId,
      };
}
