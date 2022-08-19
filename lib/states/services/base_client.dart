import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dogventurehq/constants/strings.dart';

class BaseClient {
  static Future<dynamic> getData({required String api}) async {
    print(ConstantStrings.kBaseUrl + api);
    try {
      var response = await Dio().get(ConstantStrings.kBaseUrl + api);
      print(ConstantStrings.kBaseUrl + api);
      print('GET Method: ${response.statusCode}');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> postData({
    required String api,
    required dynamic body,
  }) async {
    print(ConstantStrings.kBaseUrl + api);
    log("Post Body: $body");
    try {
      var response = await Dio().post(
        ConstantStrings.kBaseUrl + api,
        data: body,
      );
      print(ConstantStrings.kBaseUrl + api);
      print('POST Method: ${response.statusCode}');
      return response.data;
    } catch (e) {
      print(e);
    }
  }
}
