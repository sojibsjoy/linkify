import 'dart:convert';

List<AddressModel> addressModelFromJson(String str) => List<AddressModel>.from(
    json.decode(str).map((x) => AddressModel.fromJson(x)));

String addressModelToJson(List<AddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressModel {
  AddressModel({
    required this.customerAddressId,
    required this.customerId,
    required this.addressType,
    required this.phoneNumber,
    required this.countryId,
    required this.countryName,
    required this.stateId,
    required this.stateName,
    required this.cityId,
    required this.cityName,
    required this.buildingName,
    required this.nearByLocation,
    required this.latitude,
    required this.longitude,
  });

  int customerAddressId;
  int customerId;
  String addressType;
  String phoneNumber;
  int countryId;
  String countryName;
  int stateId;
  String stateName;
  int cityId;
  String cityName;
  String buildingName;
  String nearByLocation;
  double latitude;
  double longitude;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        customerAddressId: json["customerAddressId"],
        customerId: json["customerId"],
        addressType: json["addressType"],
        phoneNumber: json["phoneNumber"] ?? '',
        countryId: json["countryId"],
        countryName: json["countryName"],
        stateId: json["stateId"],
        stateName: json["stateName"],
        cityId: json["cityId"],
        cityName: json["cityName"],
        buildingName: json["buildingName"],
        nearByLocation: json["nearByLocation"],
        latitude: json["latitude"] ?? 0.0,
        longitude: json["longitude"] ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "customerAddressId": customerAddressId,
        "customerId": customerId,
        "addressType": addressType,
        "phoneNumber": phoneNumber,
        "countryId": countryId,
        "countryName": countryName,
        "stateId": stateId,
        "stateName": stateName,
        "cityId": cityId,
        "cityName": cityName,
        "buildingName": buildingName,
        "nearByLocation": nearByLocation,
        "latitude": latitude,
        "longitude": longitude,
      };
}
