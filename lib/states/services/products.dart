import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class ProductsService {
  static Future<dynamic> getProducts({required int categoryId}) async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kProductsAPI,
      parameter: {
        "categoryId": categoryId,
      },
    );
    return response;
  }

  static Future<dynamic> getProductDetails({required int pID}) async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kProductDetailsAPI,
      parameter: {"id": pID, "languageId": 4},
    );
    return response;
  }

  static Future<dynamic> getCartItems({required int customerId}) async {
    var parameterData = {
      "customerId": customerId,
      "TempId": customerId,
    };
    var response = await BaseClient.getData(
      api: ConstantStrings.kCartItemsAPI,
      parameter: parameterData,
    );
    return response;
  }

  static Future<dynamic> addToCart({required dynamic payload}) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kAddToCartAPI,
      body: payload,
    );
    return response;
  }

  static Future<dynamic> removeFromCart({required dynamic payload}) async {
    var response = await BaseClient.postData(
      api: ConstantStrings.kRemoveFromCartAPI,
      body: payload,
    );
    return response;
  }

  static Future<dynamic> removeItemFromCart({required int cartId}) async {
    var response = await BaseClient.getData(
      api: '${ConstantStrings.kRemoveItemFromCartAPI}$cartId',
    );
    return response;
  }
}
