import 'package:dogventurehq/states/models/register.dart';
import 'package:dogventurehq/states/services/auth.dart';
import 'package:get/state_manager.dart';

class AuthController extends GetxController {
  RxBool isRegistering = true.obs;
  RxBool isRegistered = false.obs;
  RxBool isLoggedIn = false.obs;

  void register(RegisterModel registerModel) async {
    isRegistering.value = true;
    try {
      var response = await AuthService.register(registerModel);
    } finally {
      isRegistering.value = false;
    }
  }
}
