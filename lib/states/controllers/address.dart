import 'dart:convert';

import 'package:dogventurehq/states/models/address.dart';
import 'package:dogventurehq/states/models/city.dart';
import 'package:dogventurehq/states/models/country.dart';
import 'package:dogventurehq/states/models/state.dart';
import 'package:dogventurehq/states/services/address.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  RxBool addressLoading = true.obs;
  RxBool countryLoading = true.obs;
  RxBool stateLoading = false.obs;
  RxBool cityLoading = false.obs;
  RxBool saveAddressLoading = true.obs;

  var addressList = <AddressModel>[].obs;
  var countryList = <CountryModel>[].obs;
  var stateList = <StateModel>[].obs;
  var cityList = <CityModel>[].obs;

  void getAddresses(int customerID) async {
    addressLoading(true);
    try {
      var response = await AddressService.getAddresses(customerID);
      addressList.value = addressModelFromJson(jsonEncode(response));
    } finally {
      addressLoading(false);
    }
  }

  void getCountries() async {
    countryLoading(true);
    try {
      var response = await AddressService.getCountries();
      countryList.value = countryModelFromJson(jsonEncode(response));
    } finally {
      countryLoading(false);
    }
  }

  void getStates({required int countryID}) async {
    stateLoading(true);
    try {
      var response = await AddressService.getStates(countryID);
      stateList.value = stateModelFromJson(jsonEncode(response));
    } finally {
      stateLoading(false);
    }
  }

  void getCities({required int stateID}) async {
    cityLoading(true);
    try {
      var response = await AddressService.getCities(stateID);
      cityList.value = cityModelFromJson(jsonEncode(response));
    } finally {
      cityLoading(false);
    }
  }

  void saveDeliveryAddress({
    required AddressModel addressModel,
    bool? isUpdating,
  }) async {
    saveAddressLoading(true);
    try {
      var response = AddressService.saveAddress(
        payload: addressModel.toJson(),
        isUpdating: isUpdating ?? false,
      );
    } finally {
      saveAddressLoading(false);
    }
  }
}
