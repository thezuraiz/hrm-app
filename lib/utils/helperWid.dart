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

  static Widget RowHelper(String firstData, String secondData){
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(firstData,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(secondData,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            )
        ),
      ],
    );
  }

  static Widget SizedWid(){
    return SizedBox(
      height: Get.height * 0.025,
    );
  }

}
