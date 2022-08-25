import 'dart:convert';

import 'package:dogventurehq/states/models/user.dart';
import 'package:get_storage/get_storage.dart';

class Preference {
  static final prefs = GetStorage();
  static const userDetails = 'userDetails';
  static const loggedInFlag = 'loginFlag';
  static const rememberMeFlag = 'rememberMeFlag';
  static const loginEmail = 'loginEmail';
  static const loginPass = 'loginPass';

  // get
  static UserModel getUserDetails() {
    var result = prefs.read(userDetails);
    return UserModel.fromJson(json.decode(result));
  }

  // set
  static void setUserDetails(UserModel value) {
    print('Storing User Details: ${json.encode(value.toJson())}');
    prefs.write(userDetails, json.encode(value.toJson()));
  }

  // get
  static bool getLoggedInFlag() {
    return prefs.read(loggedInFlag) ?? false;
  }

  // set
  static void setLoggedInFlag(bool value) {
    print('Storing Login flag: $value');
    prefs.write(loggedInFlag, value);
  }

  // get
  static bool getRememberMeFlag() {
    return prefs.read(rememberMeFlag) ?? false;
  }

  // set
  static void setRememberMeFlag(bool value) {
    print('Storing remember me flag: $value');
    prefs.write(rememberMeFlag, value);
  }

  // get
  static String getLoginEmail() {
    return prefs.read(loginEmail) ?? '';
  }

  // set
  static void setLoginEmail(String value) {
    print('Storing Login Email: $value');
    prefs.write(loginEmail, value);
  }

  // get
  static String getLoginPass() {
    return prefs.read(loginPass) ?? '';
  }

  // set
  static void setLoginPass(String value) {
    print('Storing Login Password: $value');
    prefs.write(loginPass, value);
  }

  static void logOut() {
    prefs.remove(loggedInFlag);
    prefs.remove(userDetails);
  }

  static void clearAll() {
    prefs.erase();
    print('All Data has Cleared!');
  }
}
