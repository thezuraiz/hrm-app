import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoHelper{

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