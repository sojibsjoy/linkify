import 'dart:convert';

List<OrderResponseModel> orderModelListFromJson(String str) =>
    List<OrderResponseModel>.from(
        json.decode(str).map((x) => OrderResponseModel.fromJson(x)));

String orderModelListToJson(List<OrderResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderResponseModel {
  OrderResponseModel({
    required this.invoiceMasterId,
    required this.customerId,
    required this.refNumber,
    required this.invoiceDate,
    required this.totalAmount,
    required this.receivedAmt,
    required this.status,
    required this.createdAt,
    required this.totalRecords,
    required this.billingAddressViewModels,
    required this.shippingAddressViewModels,
    required this.invoiceViewModels,
    required this.paymentViewModels,
    required this.customerViewModel,
    required this.invoiceDetailsViewModels,
  });

  int invoiceMasterId;
  int customerId;
  String refNumber;
  DateTime invoiceDate;
  double totalAmount;
  double receivedAmt;
  String status;
  DateTime createdAt;
  int totalRecords;
  IngAddressViewModels billingAddressViewModels;
  IngAddressViewModels shippingAddressViewModels;
  List<InvoiceViewModel> invoiceViewModels;
  List<PaymentViewModel> paymentViewModels;
  CustomerViewModel customerViewModel;
  List<InvoiceDetailsViewModel> invoiceDetailsViewModels;

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseModel(
        invoiceMasterId: json["invoiceMasterId"],
        customerId: json["customerId"],
        refNumber: json["refNumber"],
        invoiceDate: DateTime.parse(json["invoiceDate"]),
        totalAmount: json["totalAmount"],
        receivedAmt: json["receivedAmt"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        totalRecords: json["totalRecords"],
        billingAddressViewModels:
            IngAddressViewModels.fromJson(json["billingAddressViewModels"]),
        shippingAddressViewModels:
            IngAddressViewModels.fromJson(json["shippingAddressViewModels"]),
        invoiceViewModels: List<InvoiceViewModel>.from(
            json["invoiceViewModels"].map((x) => InvoiceViewModel.fromJson(x))),
        paymentViewModels: List<PaymentViewModel>.from(
            json["paymentViewModels"].map((x) => PaymentViewModel.fromJson(x))),
        customerViewModel:
            CustomerViewModel.fromJson(json["customerViewModel"]),
        invoiceDetailsViewModels: List<InvoiceDetailsViewModel>.from(
            json["invoiceDetailsViewModels"]
                .map((x) => InvoiceDetailsViewModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "invoiceMasterId": invoiceMasterId,
        "customerId": customerId,
        "refNumber": refNumber,
        "invoiceDate": invoiceDate.toIso8601String(),
        "totalAmount": totalAmount,
        "receivedAmt": receivedAmt,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "totalRecords": totalRecords,
        "billingAddressViewModels": billingAddressViewModels.toJson(),
        "shippingAddressViewModels": shippingAddressViewModels.toJson(),
        "invoiceViewModels":
            List<dynamic>.from(invoiceViewModels.map((x) => x.toJson())),
        "paymentViewModels":
            List<dynamic>.from(paymentViewModels.map((x) => x.toJson())),
        "customerViewModel": customerViewModel.toJson(),
        "invoiceDetailsViewModels":
            List<dynamic>.from(invoiceDetailsViewModels.map((x) => x.toJson())),
      };
}

class IngAddressViewModels {
  IngAddressViewModels({
    required this.billingShippingAddressId,
    required this.invoiceMasterId,
    required this.customerId,
    required this.customerAddressId,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.name,
    required this.stateName,
    required this.countryName,
    required this.addressLine,
    required this.addressLine2,
    required this.zipCode,
    required this.phoneNumber,
    required this.landMark,
    required this.deleveryNote,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.isDefault,
    required this.latitued,
    required this.longitued,
    required this.deleveryTime,
    required this.isBilingAddress,
    required this.isShippingAddress,
  });

  int billingShippingAddressId;
  int invoiceMasterId;
  int customerId;
  int customerAddressId;
  int countryId;
  int stateId;
  int cityId;
  String name;
  String stateName;
  String countryName;
  String addressLine;
  String addressLine2;
  String zipCode;
  String phoneNumber;
  String landMark;
  String deleveryNote;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  bool isDefault;
  String latitued;
  String longitued;
  DateTime deleveryTime;
  bool isBilingAddress;
  bool isShippingAddress;

  factory IngAddressViewModels.fromJson(Map<String, dynamic> json) =>
      IngAddressViewModels(
        billingShippingAddressId: json["billingShippingAddressId"],
        invoiceMasterId: json["invoiceMasterId"],
        customerId: json["customerId"],
        customerAddressId: json["customerAddressId"],
        countryId: json["countryId"],
        stateId: json["stateId"],
        cityId: json["cityId"],
        name: json["name"],
        stateName: json["stateName"],
        countryName: json["countryName"],
        addressLine: json["addressLine"],
        addressLine2: json["addressLine2"],
        zipCode: json["zipCode"],
        phoneNumber: json["phoneNumber"],
        landMark: json["landMark"],
        deleveryNote: json["deleveryNote"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isDefault: json["isDefault"],
        latitued: json["latitued"],
        longitued: json["longitued"],
        deleveryTime: DateTime.parse(json["deleveryTime"]),
        isBilingAddress: json["isBilingAddress"],
        isShippingAddress: json["isShippingAddress"],
      );

  Map<String, dynamic> toJson() => {
        "billingShippingAddressId": billingShippingAddressId,
        "invoiceMasterId": invoiceMasterId,
        "customerId": customerId,
        "customerAddressId": customerAddressId,
        "countryId": countryId,
        "stateId": stateId,
        "cityId": cityId,
        "name": name,
        "stateName": stateName,
        "countryName": countryName,
        "addressLine": addressLine,
        "addressLine2": addressLine2,
        "zipCode": zipCode,
        "phoneNumber": phoneNumber,
        "landMark": landMark,
        "deleveryNote": deleveryNote,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isDefault": isDefault,
        "latitued": latitued,
        "longitued": longitued,
        "deleveryTime": deleveryTime.toIso8601String(),
        "isBilingAddress": isBilingAddress,
        "isShippingAddress": isShippingAddress,
      };
}

class CustomerViewModel {
  CustomerViewModel({
    required this.customerId,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.password,
    required this.customerAddressViewModels,
    required this.firstLastName,
  });

  int customerId;
  String firstName;
  String middleName;
  String lastName;
  String email;
  int gender;
  String password;
  List<CustomerAddressViewModel> customerAddressViewModels;
  String firstLastName;

  factory CustomerViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerViewModel(
        customerId: json["customerId"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        email: json["email"],
        gender: json["gender"],
        password: json["password"],
        customerAddressViewModels: List<CustomerAddressViewModel>.from(
            json["customerAddressViewModels"]
                .map((x) => CustomerAddressViewModel.fromJson(x))),
        firstLastName: json["firstLastName"],
      );

  Map<String, dynamic> toJson() => {
        "customerId": customerId,
        "firstName": firstName,
        "middleName": middleName,
        "lastName": lastName,
        "email": email,
        "gender": gender,
        "password": password,
        "customerAddressViewModels": List<dynamic>.from(
            customerAddressViewModels.map((x) => x.toJson())),
        "firstLastName": firstLastName,
      };
}

class CustomerAddressViewModel {
  CustomerAddressViewModel({
    required this.customerAddressId,
    required this.customerId,
    required this.addressType,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.status,
    required this.countryName,
    required this.stateName,
    required this.cityName,
  });

  int customerAddressId;
  int customerId;
  String addressType;
  int countryId;
  int stateId;
  int cityId;
  String status;
  String countryName;
  String stateName;
  String cityName;

  factory CustomerAddressViewModel.fromJson(Map<String, dynamic> json) =>
      CustomerAddressViewModel(
        customerAddressId: json["customerAddressId"],
        customerId: json["customerId"],
        addressType: json["addressType"],
        countryId: json["countryId"],
        stateId: json["stateId"],
        cityId: json["cityId"],
        status: json["status"],
        countryName: json["countryName"],
        stateName: json["stateName"],
        cityName: json["cityName"],
      );

  Map<String, dynamic> toJson() => {
        "customerAddressId": customerAddressId,
        "customerId": customerId,
        "addressType": addressType,
        "countryId": countryId,
        "stateId": stateId,
        "cityId": cityId,
        "status": status,
        "countryName": countryName,
        "stateName": stateName,
        "cityName": cityName,
      };
}

class InvoiceDetailsViewModel {
  InvoiceDetailsViewModel({
    required this.invoiceDetailsId,
    required this.invoiceId,
    required this.productMasterId,
    required this.quantity,
    required this.price,
    required this.productName,
    required this.productSkuId,
    required this.subSku,
    required this.largeImage,
    required this.mediumImage,
  });

  int invoiceDetailsId;
  int invoiceId;
  int productMasterId;
  double quantity;
  double price;
  String productName;
  int productSkuId;
  String subSku;
  String largeImage;
  String mediumImage;

  factory InvoiceDetailsViewModel.fromJson(Map<String, dynamic> json) =>
      InvoiceDetailsViewModel(
        invoiceDetailsId: json["invoiceDetailsId"],
        invoiceId: json["invoiceId"],
        productMasterId: json["productMasterId"],
        quantity: json["quantity"],
        price: json["price"],
        productName: json["productName"],
        productSkuId: json["productSkuId"],
        subSku: json["subSku"],
        largeImage: json["largeImage"],
        mediumImage: json["mediumImage"],
      );

  Map<String, dynamic> toJson() => {
        "invoiceDetailsId": invoiceDetailsId,
        "invoiceId": invoiceId,
        "productMasterId": productMasterId,
        "quantity": quantity,
        "price": price,
        "productName": productName,
        "productSkuId": productSkuId,
        "subSku": subSku,
        "largeImage": largeImage,
        "mediumImage": mediumImage,
      };
}

class InvoiceViewModel {
  InvoiceViewModel({
    required this.invoiceId,
    required this.invoiceMasterId,
    required this.refNumber,
    required this.invoiceDate,
    required this.totalAmount,
    required this.receivedAmt,
    required this.storeId,
    required this.status,
  });

  int invoiceId;
  int invoiceMasterId;
  String refNumber;
  DateTime invoiceDate;
  double totalAmount;
  double receivedAmt;
  int storeId;
  String status;

  factory InvoiceViewModel.fromJson(Map<String, dynamic> json) =>
      InvoiceViewModel(
        invoiceId: json["invoiceId"],
        invoiceMasterId: json["invoiceMasterId"],
        refNumber: json["refNumber"],
        invoiceDate: DateTime.parse(json["invoiceDate"]),
        totalAmount: json["totalAmount"],
        receivedAmt: json["receivedAmt"],
        storeId: json["storeId"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "invoiceId": invoiceId,
        "invoiceMasterId": invoiceMasterId,
        "refNumber": refNumber,
        "invoiceDate": invoiceDate.toIso8601String(),
        "totalAmount": totalAmount,
        "receivedAmt": receivedAmt,
        "storeId": storeId,
        "status": status,
      };
}

class PaymentViewModel {
  PaymentViewModel({
    required this.paymentId,
    required this.invoiceMasterId,
    required this.currencyId,
    // required this.amount,
    // required this.courierCharge,
    // required this.discountAmount,
    // required this.carryingCost,
    // required this.paymentMethod,
    // required this.payDate,
    required this.methodName,
    required this.statusName,
  });

  int paymentId;
  int invoiceMasterId;
  int currencyId;
  // double amount;
  // int courierCharge;
  // int discountAmount;
  // int carryingCost;
  // int paymentMethod;
  // DateTime payDate;
  String methodName;
  String statusName;

  factory PaymentViewModel.fromJson(Map<String, dynamic> json) =>
      PaymentViewModel(
        paymentId: json["paymentId"],
        invoiceMasterId: json["invoiceMasterId"],
        currencyId: json["currencyId"],
        // amount: json["amount"],
        // courierCharge: json["courierCharge"],
        // discountAmount: json["discountAmount"],
        // carryingCost: json["carryingCost"],
        // paymentMethod: json["paymentMethod"],
        // payDate: DateTime.parse(json["payDate"]),
        methodName: json["methodName"],
        statusName: json["statusName"],
      );

  Map<String, dynamic> toJson() => {
        "paymentId": paymentId,
        "invoiceMasterId": invoiceMasterId,
        "currencyId": currencyId,
        // "amount": amount,
        // "courierCharge": courierCharge,
        // "discountAmount": discountAmount,
        // "carryingCost": carryingCost,
        // "paymentMethod": paymentMethod,
        // "payDate": payDate.toIso8601String(),
        "methodName": methodName,
        "statusName": statusName,
      };
}
