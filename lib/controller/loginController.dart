import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:hrmapp/utils/helperWid.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isLoading = false.obs;


  Future<String> loginApi(String baseUrl) async {
    isLoading.value = true;
    // print("Login Controller");

    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    // print("Email: $email");
    // print("Password: $password");
    FocusManager.instance.primaryFocus!.unfocus();
    try {
      final credentials = {
        "email": email,
        "password": password,
      };

      final response = await http.post(
        Uri.parse("$baseUrl/Token"),
        body: jsonEncode(credentials),
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        debugPrint("response.body: ${response.body}");
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("token", jsonDecode(response.body)["token"]);
        debugPrint('token: ${jsonDecode(response.body)["token"]}');
        debugPrint('Time ${DateTime.now()}');
        HelperWidgets.Greentoaster("You are Loggined");
        isLoading.value = false;
        return response.body;
      } else {
        isLoading.value = false;
        HelperWidgets.Errortoaster("Invalid Credentials");
        return '';
      }
    } on SocketException {
      isLoading.value = false;
      HelperWidgets.Errortoaster("No Internet connection");
      throw Exception('No internet connection');
    }
  }
}
