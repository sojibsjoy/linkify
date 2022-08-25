import 'package:dogventurehq/constants/strings.dart';
import 'package:dogventurehq/states/services/base_client.dart';

class AddressService {
  //?customerId=10270

  static Future<dynamic> getAddresses(int customerId) async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kDeliveryAddressesAPI,
      parameter: {
        "customerId": customerId,
      },
    );
    return response;
  }

  static Future<dynamic> getCountries() async {
    var response = await BaseClient.getData(
      api: ConstantStrings.kCountryAPI,
    );
    return response;
  }

  static Future<dynamic> getStates(int countryId) async {
    var response = await BaseClient.getData(
      api: '${ConstantStrings.kStateAPI}$countryId',
    );
    return response;
  }

  static Future<dynamic> getCities(int stateId) async {
    var response = await BaseClient.getData(
      api: '${ConstantStrings.kCityAPI}$stateId',
    );
    return response;
  }

  static Future<dynamic> saveAddress({
    required dynamic payload,
    required bool isUpdating,
  }) async {
    var response = await BaseClient.postData(
      api: isUpdating
          ? ConstantStrings.kUpdateDeliveryAddresstAPI
          : ConstantStrings.kDeliveryAddressesAPI,
      body: payload,
    );
    return response;
  }
}
