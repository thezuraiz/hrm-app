import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hrmapp/controller/globalController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LeaveSubmitController extends GetxController{

  @override
  void onInit()async{
    // TODO: implement onInit
    super.onInit();
    await fetchPriority();
    await fetchType();
  }

  GlobalController globalController = Get.put(GlobalController());

  RxList<Map> priorityDropdownOptions = <Map<dynamic, dynamic>>[].obs;
  RxString priority = ''.obs;

  RxList<Map> leaveTypeDropdownOptions = <Map<dynamic, dynamic>>[].obs;
  RxString todoType = ''.obs;

  Future fetchPriority() async {
    String carearUrl = '/LeaveApi/LeavePriorities';
    String url = "${GlobalController.baseUrl}$carearUrl";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    // debugPrint("token: $token");

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
        for (Map i in context) {
          // debugPrint("I: ${i['text']}");
          priorityDropdownOptions.add({
            "disabled": i['disabled'],
            "group": i['group'],
            "selected": i['selected'],
            "text": i['text'],
            "value": i['value']
          });
        }
        debugPrint("context $context");
        return data;
      } else {
        throw Exception("Empty response body");
      }
    } catch (e) {
      debugPrint("Failed to fetch Todo: $e");
      throw Exception("Failed to fetch Todo: $e");
    }
  }
  Future fetchType() async {
    String carearUrl = '/LeaveApi/LeaveTypes';
    String url = "${GlobalController.baseUrl}$carearUrl";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    // debugPrint("token: $token");

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
        // debugPrint("Response: ${data.toString()}");

        var context = data['data'];
        for (Map i in context) {
          // debugPrint("->: ${i['text']}");
          leaveTypeDropdownOptions.add({
            "disabled": i['disabled'],
            "group": i['group'],
            "selected": i['selected'],
            "text": i['text'],
            "value": i['value']
          });
        }
        debugPrint("context $context");
        return data;
      } else {
        throw Exception("Empty response body");
      }
    } catch (e) {
      debugPrint("Failed to fetch Todo: $e");
      throw Exception("Failed to fetch Todo: $e");
    }
  }

  Rx<TextEditingController> fromDate = TextEditingController().obs;
  RxString toDate = "".obs;

}