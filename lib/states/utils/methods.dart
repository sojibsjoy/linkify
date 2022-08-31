import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class Methods {
  static void showSnackbar({
    // required BuildContext context,
    String? title,
    required String msg,
    IconData? icon,
    SnackPosition? position,
  }) {
    // ScaffoldMessenger.of(context).showSnackBar(snackBar(
    //   title: title,
    //   msg: msg,
    //   icon: icon,
    //   position: position,
    // ));
    Get.snackbar(
      title ?? 'Error',
      msg,
      icon: Icon(
        icon ?? Icons.error,
        color: Colors.red,
      ),
      snackPosition: position ?? SnackPosition.BOTTOM,
      animationDuration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 20),
      duration: const Duration(seconds: 2),
    );
  }

  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
