import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmapp/controller/globalController.dart';
import 'package:hrmapp/view/leaves/leave_screen.dart';
import 'package:hrmapp/view/todo/todo_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../utils/helperWid.dart';

class LeaveSubmitController extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchPriority();
    await fetchType();
  }

  GlobalController globalController = Get.put(GlobalController());

  RxBool loading = false.obs;

  RxList<Map> priorityDropdownOptions = <Map<dynamic, dynamic>>[].obs;
  RxString priority = ''.obs;

  RxList<Map> leaveTypeDropdownOptions = <Map<dynamic, dynamic>>[].obs;
  RxString leaveType = ''.obs;

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
  Rx<TextEditingController> toDate = TextEditingController().obs;

  leaveSubmit() async {
    loading.value = true;
    try {
      final formData = {
        "leaveTypeId": leaveType.value,
        "leavePriorityId": priority.value,
        "fromDate": fromDate.value.text.toString(),
        "toDate": toDate.value.text.toString(),
        // "onBehalfId": globalController.employeeData.value,
      };

      debugPrint("FormData: ${formData.toString()}");

      const url = "${GlobalController.baseUrl}/LeaveApi/Submit";
      final token = await SharedPreferences.getInstance()
          .then((prefs) => prefs.getString("token"));
      final headers = {
        'Content-Type': 'application/json-patch+json',
        'Accept': 'application/json',
        'Authorization': "Bearer $token"
      };

      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(formData));

      // Handle response
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint("Form Submitted: $data");
        if (data['isSuccess']) {}
        // debugPrint("Leave Form Submited: $data");
        loading.value = false;
        leaveType.value = "";
        priority.value = "";
        fromDate.value.text = "";
        toDate.value.text = "";
        HelperWidgets.Greentoaster("Form Submitted! ${data['isSuccess']}");
      } else {
        loading.value = false;
        // final data = jsonDecode(response.body);
        HelperWidgets.Errortoaster("Something Went Wrong");
      }
    } on SocketException catch (err) {
      loading.value = false;
      HelperWidgets.Errortoaster("Internet Connection Failed");
    } catch (e) {
      loading.value = false;
      debugPrint("Failed to submit form: $e");
      HelperWidgets.Errortoaster(
          "Failed to submit form. Please try again later.");
    }
  }
}
