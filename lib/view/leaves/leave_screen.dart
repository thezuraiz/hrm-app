import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hrmapp/utils/helperWid.dart';
import 'package:hrmapp/view/leaves/leave_submit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../utils/todo_helperWidgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  Future fetchLeaves<LeavesModel>() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    debugPrint("Token in : $token");
    try {
      String url = "https://leaves-hrm.solutions36t.com/api/LeaveApi";
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
        // debugPrint("Response: ${data['data'].toString()}");
        // debugPrint("Response: ${data.length}");
        return data;
      } else {
        throw Exception("Empty response body");
      }
    } catch (e) {
      debugPrint("Failed to fetch Todo: $e");
      throw Exception("Failed to fetch Todo: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Leaves",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.to(LeaveSubmit()),
            child: Row(
              children: [
                const Text("Add",
                    style: TextStyle(fontSize: 32, color: Colors.blue)),
                SizedBox(
                  width: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: Icon(
                      Icons.add,
                      size: 30,
                    ))
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: fetchLeaves(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: snapshot.data['data'].length,
                        itemBuilder: (context, index) {
                          final cardData = snapshot.data!['data'][index];
                          debugPrint("Card Data ${cardData.toString()}");
                          DateTime fromData =
                              DateTime.parse(cardData['fromDate'].toString());
                          DateTime toData =
                              DateTime.parse(cardData['toDate'].toString());

                          String formattedDate(final date) {
                            return DateFormat('dd-MM-yyyy')
                                .format(date)
                                .toString();
                          }

                          ;
                          return Slidable(
                            // key: ValueKey(content['todoType']['name']),
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: [
                                SlidableAction(
                                    backgroundColor: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                    autoClose: true,
                                    icon: Icons.delete,
                                    label: "Remove",
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
                              ],
                            ),
                            child: Card(
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                // leading: CircleAvatar(
                                //   child: Text("${index + 1}"),
                                // ),
                                // title: Row(
                                //     mainAxisAlignment:
                                //     MainAxisAlignment.center,
                                //     children: [
                                //       Text(
                                //         cardData['leaveType']['name'].toString(),
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .titleLarge,
                                //       )
                                //     ]),
                                subtitle: Column(
                                  children: [
                                    TodoHelper.RowHelper("Leave: ",
                                        "${cardData['leaveType']['name']}"),
                                    // TodoHelper.RowHelper("Leave Priority: ",
                                    //     "${cardData['leavePriority']}"),
                                    TodoHelper.RowHelper("OnBehalf: ",
                                        "${cardData['onBehalf']['firstName']} ${cardData['onBehalf']['lastName']}"),
                                    TodoHelper.RowHelper("Start Date: ",
                                        formattedDate(fromData)),
                                    TodoHelper.RowHelper(
                                        "Last Date: ", formattedDate(toData)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Is Approved",
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Checkbox(value: true, onChanged: (e) {})
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
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
    );
  }
}
