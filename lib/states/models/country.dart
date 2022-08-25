import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

String countryModelToJson(List<CountryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CountryModel {
  CountryModel({
    required this.countryId,
    // required this.iso,
    required this.countryName,
    // required this.longCountryName,
    // required this.iso3,
    // required this.countryCode,
    // required this.unMemberState,
    // required this.callingCode,
    // required this.ccTld,
    // required this.guidId,
    required this.image,
  });

  int countryId;
  // String iso;
  String countryName;
  // String longCountryName;
  // String iso3;
  // String countryCode;
  // String unMemberState;
  // String callingCode;
  // String ccTld;
  // String guidId;
  String image;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        countryId: json["countryId"] ?? 0,
        // iso: json["iso"],
        countryName: json["countryName"] ?? '',
        // longCountryName: json["longCountryName"] ?? '',
        // iso3: json["iso3"],
        // countryCode: json["countryCode"] ?? '',
        // unMemberState: json["unMemberState"],
        // callingCode: json["callingCode"],
        // ccTld: json["ccTld"],
        // guidId: json["guidId"],
        image: json["image"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "countryId": countryId,
        // "iso": iso,
        "countryName": countryName,
        // "longCountryName": longCountryName,
        // "iso3": iso3,
        // "countryCode": countryCode,
        // "unMemberState": unMemberState,
        // "callingCode": callingCode,
        // "ccTld": ccTld,
        // "guidId": guidId,
        "image": image,
      };
}
