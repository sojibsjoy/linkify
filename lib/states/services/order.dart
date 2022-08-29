import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class OrderService {
  // Category Function
  static Future<dynamic> getCurrentOrders(
    int userId,
  ) async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kOrderAPI,
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
