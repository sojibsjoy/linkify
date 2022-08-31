import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class OrderService {
  // Get Order Function
  static Future<dynamic> getOrders({
    required String api,
    required int userId,
  }) async {
    var response = await BaseClient.getData(
      api: api,
      parameter: {
        "userId": userId,
      },
    );
    return response;
  }

  static Future<dynamic> placeOrder(
    dynamic payload,
  ) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kOrderAPI,
      body: payload,
    );
    return response;
  }
}
