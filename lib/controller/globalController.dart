import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GlobalController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    onBehalf();
  }

  static const String baseUrl = "https://leaves-hrm.solutions36t.com/api";

  RxList<Map> employeeData = <Map<dynamic,dynamic>>[].obs;

  Future<void> onBehalf() async {
    String carearUrl = '/LeaveApi/OnBehalfEmployees';
    String url = "${GlobalController.baseUrl}$carearUrl";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },
      );

      debugPrint("Status: ${response.statusCode}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint("Response: ${data.toString()}");

        var context = data['data'];
        debugPrint("Onbehalf ${context}");
        for (Map i in context) {
          debugPrint("Employee->: ${i['text']}");
          employeeData.add({
            "disabled": i['disabled'],
            "group": i['group'],
            "selected": i['selected'],
            "text": i['text'],
            "value": i['value']
          });
        }
        debugPrint("employeeData: ${employeeData.toString()}");
      } else {
        throw Exception("Failed to fetch data: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Failed to fetch data: $e");
      throw Exception("Failed to fetch data: $e");
    }
  }

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      controller.text = picked.toString();
    }
  }

}