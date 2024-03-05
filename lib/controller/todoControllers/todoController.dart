import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hrmapp/controller/globalController.dart';
import 'package:hrmapp/utils/helperWid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TodoController extends GetxController {

  Rx<TextEditingController> itemController = TextEditingController().obs;
  Rx<TextEditingController> descController = TextEditingController().obs;
  Rx<TextEditingController> startDate = TextEditingController().obs;
  Rx<TextEditingController> endDate = TextEditingController().obs;

  RxString selectedEmplyee = ''.obs;

  RxBool isDone = false.obs;
  RxBool isLoading = false.obs;

  RxList<Map> priorityDropdownOptions = <Map<dynamic, dynamic>>[].obs;
  RxString priority = ''.obs;

  RxList<Map> todoTypeDropdownOptions = <Map<dynamic, dynamic>>[].obs;
  RxString todoType = ''.obs;

  RxList todos = [].obs;
  RxBool loadingTodo = true.obs;

  Future<void> fetchData() async {
    debugPrint("Fetching Todoes");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // debugPrint("Token in : $token");
    try {
      final response = await http.get(
        Uri.parse("https://leaves-hrm.solutions36t.com/api/TodoApi"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },
      );

      // debugPrint("Status: ${response.statusCode}");
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map;
        final result = json['data'] as List;
        todos.value = result;

        // debugPrint("Response: ${data.toString()}");
        // debugPrint("Response: ${data.length}");
      } else {
        HelperWidgets.Errortoaster("Empty response body");
        throw Exception("Empty response body");
      }
    } catch (e) {
      debugPrint("Failed to fetch Todo: $e");
      throw Exception("Failed to fetch Todo: $e");
    }
      loadingTodo.value = false;
  }

  Future fetchPriority() async {
    String carearUrl = '/TodoApi/TodoPriorities';
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

  Future fetchTodoType() async {
    String carearUrl = '/TodoApi/TodoTypes';
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
          todoTypeDropdownOptions.add({
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

  submitTodo() async {
    isLoading.value = true;
    try {
      // Get required controllers
      final item = itemController.value.text.trim().toString();
      final description = descController.value.text.trim().toString();
      final todoId = todoType.value;
      final done = isDone.value;
      final start = startDate.value.text.toString();
      final end = endDate.value.text.toString();
      final behalfId = selectedEmplyee.value;
      final prior = priority.value;

      // Prepare form data
      final formData = {
        "todoItem": item,
        "description": description,
        "todoTypeId": todoId,
        "isDone": done,
        "startDate": start,
        "endDate": end,
        "onBehalfId": behalfId,
        "TodoPriorityId": prior,
      };

      // debugPrint("FormData: ${formData.toString()}");

      const url = "${GlobalController.baseUrl}/TodoApi/Submit";
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
        // debugPrint("Form Submitted: $data");
        if (data['isSuccess']) {
          fetchData();
          itemController.value.text = "";
          descController.value.text = "";
          startDate.value.text = "";
          endDate.value.text = "";
          isDone.value = false;

          // Set Controllers to default
          priorityDropdownOptions.value.first.values;
          todoTypeDropdownOptions.value.first.values;
        }
        isLoading.value = false;
        HelperWidgets.Greentoaster("Form Submitted! ${data['isSuccess']}");
      } else {
        // final data = jsonDecode(response.body);
        isLoading.value = false;
        // Get.snackbar("Error", data['errors'].toString());
        HelperWidgets.Errortoaster("Something Went Wrong");
      }
    } on SocketException catch (err) {
      isLoading.value = false;
      HelperWidgets.Errortoaster("Internet Connection Failed");
    } catch (e) {
      isLoading.value = false;
      debugPrint("Failed to submit form: $e");
      HelperWidgets.Errortoaster(
          "Failed to submit form. Please try again later.");
    }
  }
}
