import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HelperWidgets {
  static Errortoaster(String errMsg) {
    return Get.snackbar(
      "Error",
      errMsg,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    );
  }

  static Greentoaster(String Msg) {
    return Get.snackbar(
      "Welcome",
      Msg,
      backgroundColor: Colors.blue,
      colorText: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    );
  }
}
