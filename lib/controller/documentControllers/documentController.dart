import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:get/get.dart';
import 'package:hrmapp/controller/globalController.dart';
import 'package:hrmapp/utils/helperWid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DocumentController extends GetxController{

  GlobalController globalController = Get.put(GlobalController());

  RxList documents = [].obs;
  RxList<Map> documentTypes = <Map<dynamic, dynamic>>[].obs;
  RxString selectedDocumentType = ''.obs;
  RxBool loadingDocuments = false.obs;

  RxBool formLoading = false.obs;
  Rx<File> file = File('').obs;

  RxList<Map> documentType = <Map<dynamic, dynamic>>[].obs;

  Future<void> fetchDocuments() async {
    debugPrint('Fetching Documents');
    loadingDocuments.value = true;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    // debugPrint("Token in : $token");
    try {
      String url = "https://leaves-hrm.solutions36t.com/api/DocumentApi";
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
        final json = jsonDecode(response.body);
        debugPrint("Documents -> ${json['data'].toString()}");
        final result = json['data'];
        documents.value = result;
        loadingDocuments.value = false;
      } else {
        HelperWidgets.Errortoaster("Somthing Went Wrong!");
        loadingDocuments.value = false;
        throw Exception("Empty response body");
      }
    } on SocketException catch (e) {
      HelperWidgets.Errortoaster("Internet Connection Failed");
      loadingDocuments.value = false;
      throw const SocketException("Internet Connection Failed");
    } catch (e) {
      // debugPrint("Failed to fetch Todo: $e");
      loadingDocuments.value = false;
      HelperWidgets.Errortoaster("Failed to fetch Todo: $e");
      throw Exception("Failed to fetch Todo: $e");
    }
  }

  Future<void> fetchDocumentTypes() async {
    debugPrint('Fetching Document Types');
    String url = 'https://leaves-hrm.solutions36t.com/api/DocumentApi/DocumentTypes';
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
        final json = jsonDecode(response.body) as Map;
        var context = json['data'];
        for (Map i in context) {
          // debugPrint("I: ${i['text']}");
          documentTypes.add({
            "disabled": i['disabled'],
            "group": i['group'],
            "selected": i['selected'],
            "text": i['text'],
            "value": i['value']
          });
        }

      } else {
        throw Exception("Empty response body");
      }
    } catch (e) {
      debugPrint("Failed to fetch Todo: $e");
      throw Exception("Failed to fetch Todo: $e");
    }
  }

  void downloadFile(Map obj) async {

    String downloadUrl = 'https://leaves-hrm.solutions36t.com/Uploads/Documents/' + "${obj['employeeId']}/" + obj['relativeName'];
      final fileNameParts = obj['documentName'].toString().split('.');
      final fileName = fileNameParts.first;
      debugPrint("Download Url: $downloadUrl");
      debugPrint("FileName: $fileName");

    try {
      FileDownloader.downloadFile(
        url: downloadUrl,
        name: fileName,
        notificationType: NotificationType.all,
        onDownloadRequestIdReceived: (downloadId) {
          HelperWidgets.Greentoaster("Download Started");
        },
        onDownloadCompleted: (path) {
          final file = File(path);
          debugPrint(file.toString());
          HelperWidgets.Greentoaster("Download Completed");
        },
        onDownloadError: (errorMessage) {
          HelperWidgets.Errortoaster("Download Failed");
        },
      );
    }catch(e){
      debugPrint("Error: " + e.toString() );
    }
  }

  Future<void> addDocument() async {
    formLoading.value = true;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      // Read file content as bytes
      List<int> fileBytes = await file.value.readAsBytes();

      // Convert file content to base64
      String fileBase64 = base64Encode(fileBytes);

      // Prepare the request body
      Map<String, dynamic> requestBody = {
        "documentName": file.value.path.split('/').last,
        "documentTypeId": selectedDocumentType.value,
        "employeeId": '19cc0518-b993-4f8f-901b-85c4068e7faa', // Make sure this is a string
        "fileBase64Content": fileBase64
      };

      // Send the request
      final response = await http.post(
        Uri.parse('https://leaves-hrm.solutions36t.com/api/DocumentApi/Submit'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );
      formLoading.value = false;
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint("Form Submitted: $data");
        if (data['isSuccess']) {
          HelperWidgets.Greentoaster("Document Added! ${data['isSuccess']}");
          fetchDocuments();
        }
      } else {
        debugPrint("Error: ${response.statusCode}");
        debugPrint("Response Body: ${response.body}");
        HelperWidgets.Errortoaster("Something Went Wrong");
      }
    } on SocketException catch (err) {
      debugPrint("Socket Exception: $err");
      formLoading.value = false;
      HelperWidgets.Errortoaster("Internet Connection Failed");
    } catch (e) {
      debugPrint("Error: $e");
      formLoading.value = false;
      HelperWidgets.Errortoaster("Failed to submit form. Please try again later.");
    }
  }




  setFile()async{
    file.value = File('');
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      file.value = File(result.files.single.path!);
      debugPrint("File Value: ${file.value}");
    } else {
      HelperWidgets.Errortoaster("No File Picked");
      // User canceled the picker
    }
  }

  formattedDate(final date) {
    return DateFormat('dd-MM-yyyy').format(DateTime.parse(date)).toString();
  }

}