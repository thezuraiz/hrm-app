import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/document/DocumentModel.dart';
import '../../utils/helperWid.dart';
import '../../utils/todo_helperWidgets.dart';
import 'package:intl/intl.dart';

class DocumentApi extends StatefulWidget {
  const DocumentApi({super.key});

  @override
  State<DocumentApi> createState() => _DocumentApiState();
}

class _DocumentApiState extends State<DocumentApi> {
  Future getDocuments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    debugPrint("Token in : $token");
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
        final data = jsonDecode(response.body);
        debugPrint("Documents -> ${data.toString()}");
        return data;
      } else {
        throw Exception("Empty response body");
      }
    } on SocketException catch (e) {
      HelperWidgets.Errortoaster("Internet Connection Failed");
      throw SocketException("Internet Connection Failed");
    } catch (e) {
      debugPrint("Failed to fetch Todo: $e");
      throw Exception("Failed to fetch Todo: $e");
    }
  }

  formattedDate(final date) {
    return DateFormat('dd-MM-yyyy').format(DateTime.parse(date)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List of Dokumente",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.w500, fontSize: 36),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.01,
            ),
            FutureBuilder(
              future: getDocuments(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  } else if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, index) {
                          final cardData = snapshot.data['data'][index];
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 3),
                            child: Slidable(
                              startActionPane: ActionPane(
                                motion: DrawerMotion(),
                                children: [
                                  SlidableAction(
                                      backgroundColor: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(20),
                                      autoClose: true,
                                      icon: CupertinoIcons.cloud_download,
                                      label: "Download",
                                      onPressed: (context) {

                                      }),
                                ],
                              ),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                      backgroundColor: Colors.greenAccent,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20)),
                                      autoClose: true,
                                      icon: Icons.edit,
                                      label: "Edit",
                                      onPressed: (context) {
                                        // String createdById =
                                        // content['createdById'];
                                        // String createdAtUtc =
                                        // content['createdAtUtc'];
                                        // String updatedById =
                                        // content['updatedById'];
                                        // String updatedAtUtc =
                                        // content['updatedAtUtc'];
                                        // String todoId = content['todoId'];
                                        // String todoItem = content['todoItem'];
                                        // String description =
                                        // content['description'];
                                        // bool isDone = content['isDone'];
                                        // String todoTypeId =
                                        // content['todoTypeId'];
                                        // String startDate =
                                        // content['startDate'];
                                        // String endDate = content['endDate'];
                                        // String onBehalfId =
                                        // content['onBehalfId'];
                                        // String todoPriorityId =
                                        // content['todoPriorityId'];
                                      }),
                                  SlidableAction(
                                      backgroundColor: Colors.red,
                                      autoClose: true,
                                      icon: Icons.delete,
                                      label: "Remove",
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          bottomRight: Radius.circular(20)),
                                      onPressed: (context) {
                                        // String createdById =
                                        // content['createdById'];
                                        // String createdAtUtc =
                                        // content['createdAtUtc'];
                                        // String updatedById =
                                        // content['updatedById'];
                                        // String updatedAtUtc =
                                        // content['updatedAtUtc'];
                                        // String todoId = content['todoId'];
                                        // String todoItem = content['todoItem'];
                                        // String description =
                                        // content['description'];
                                        // bool isDone = content['isDone'];
                                        // String todoTypeId =
                                        // content['todoTypeId'];
                                        // String startDate =
                                        // content['startDate'];
                                        // String endDate = content['endDate'];
                                        // String onBehalfId =
                                        // content['onBehalfId'];
                                        // String todoPriorityId =
                                        // content['todoPriorityId'];
                                      })
                                ],
                              ),
                              child: Card(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 8),
                                  subtitle: Column(
                                    children: [
                                      TodoHelper.RowHelper("Document: ",
                                          "${cardData['documentName']}"),
                                      TodoHelper.RowHelper("Document Type: ",
                                          "${cardData['documentType']['name']}"),
                                      TodoHelper.RowHelper("Employee: ",
                                          "${cardData['employee']['firstName']} ${cardData['employee']['lastName']}"),
                                      TodoHelper.RowHelper("Created On: ",
                                          "${formattedDate(cardData['updatedAtUtc'].toString())}"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return SizedBox(
                      height: Get.height * 0.8,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                } else {
                  return SizedBox(
                    height: Get.height * 0.8,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
