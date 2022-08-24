import 'dart:convert';

import 'package:dogventurehq/states/models/user.dart';
import 'package:get_storage/get_storage.dart';

class Preference {
  static final prefs = GetStorage();
  static const userDetails = 'userDetails';
  static const loggedInFlag = 'loginFlag';

  static UserModel getUserDetails() {
    var result = prefs.read(userDetails);
    return UserModel.fromJson(json.decode(result));
  }

  static void setUserDetails(UserModel value) {
    print('User Details: ${json.encode(value.toJson())}');
    prefs.write(userDetails, json.encode(value.toJson()));
  }

  static bool getLoggedInFlag() {
    return prefs.read(loggedInFlag) ?? false;
  }

  static void setLoggedInFlag(bool value) {
    print('Login flag: $value');
    prefs.write(loggedInFlag, value);
  }

  static void clearAll() {
    prefs.erase();
    print('All Data has Cleared!');
  }
}
