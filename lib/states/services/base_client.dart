import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dogventurehq/constants/strings.dart';

class BaseClient {
  static Future<dynamic> getData({required String api}) async {
    String url = ConstantStrings.kBaseUrl + ConstantStrings.kAPIVersion + api;
    print(url);
    try {
      var response = await Dio().get(
        ConstantStrings.kBaseUrl + ConstantStrings.kAPIVersion + api,
      );
      print(url);
      print('GET Method: ${response.statusCode}');
      log("GET Response:  ${response.data}");
      return response.data;
    } catch (e) {
      print("Error: $e");
    }
  }

  static Future<dynamic> postData({
    required String api,
    required dynamic body,
  }) async {
    String url = ConstantStrings.kBaseUrl + ConstantStrings.kAPIVersion + api;
    print(url);
    log("Post Body: $body");
    try {
      var response = await Dio().post(
        ConstantStrings.kBaseUrl + ConstantStrings.kAPIVersion + api,
        data: body,
      );
      print(url);
      print('POST Method: ${response.statusCode}');
      log("POST Response:  ${response.data}");
      return response.data;
    } catch (e) {
      print("Error: $e");
    }
  }
}
