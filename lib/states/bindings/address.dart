import 'package:dogventurehq/states/controllers/address.dart';
import 'package:get/instance_manager.dart';

class AddressBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddressController());
  }
}
