import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hrmapp/controller/leaveControllers/leaveController.dart';
import 'package:hrmapp/utils/helperWid.dart';
import 'package:hrmapp/view/leaves/leave_submit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LeaveScreen extends StatefulWidget {
  const LeaveScreen({super.key});

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  @override
  void initState() {
    // TODO: implement initState
    leaveController.fetchLeaves();
    super.initState();
  }

  LeaveController leaveController = Get.put(LeaveController());

  Future<void> deleteLeaves(Map data) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    debugPrint("Token in : $token");
    debugPrint("Leave Data: ${data.toString()}");
    try {
      String url = "https://leaves-hrm.solutions36t.com/api/LeaveApi/Delete";
      final Map deleteMap = {
        "leaveId": data['leaveId'],
        "leaveName": data['leaveName'],
        "description": data['description'],
        "emergencyCall": data['emergencyCall'],
        "isApproved": data['isApproved'],
        "onBehalfId": data['onBehalfId'],
        "leaveTypeId": data['leaveTypeId'],
        "leavePriority": data['leavePriority'],
        "leavePriorityId": data['leavePriorityId'],
        "fromDate": data['fromDate'],
        "toDate": data['toDate'],
      };

      debugPrint('Delete Map: ${deleteMap.toString()}');
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        },
        body: jsonEncode(deleteMap),
      );

      // debugPrint("Status: ${response.statusCode}");
      if (response.statusCode == 200) {
        HelperWidgets.Greentoaster("Leave Deleted");
        final filtered = leaveController.Leaves.where(
            (element) => element['leaveId'] != data['leaveId']).toList();
        leaveController.Leaves.value = filtered;
      } else {
        HelperWidgets.Errortoaster("Something Went Wrong");
        throw Exception("Empty response body");
      }
    } catch (e) {
      debugPrint("Failed to fetch Todo: $e");
      throw Exception("Failed to fetch Todo: $e");
    }
    leaveController.isLoading.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Leaves",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () => Get.to(const LeaveSubmit()),
            child: Row(
              children: [
                const Text("Add",
                    style: TextStyle(fontSize: 32, color: Colors.blue)),
                const SizedBox(
                  width: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50))),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ))
              ],
            ),
          ),
        ],
      ),
      body: Obx(() => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
              visible: leaveController.isLoading.value,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: Visibility(
                visible: leaveController.Leaves.value.isNotEmpty,
                replacement: Center(
                  child: Text(
                    "No Leaves",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                child: ListView.builder(
                    itemCount: leaveController.Leaves.value.length,
                    itemBuilder: (_c, i) {
                      final cardData = leaveController.Leaves.value[i];
                      DateTime fromData =
                          DateTime.parse(cardData['fromDate'].toString());
                      DateTime toData =
                          DateTime.parse(cardData['toDate'].toString());

                      String formattedDate(final date) {
                        return DateFormat('dd-MM-yyyy').format(date).toString();
                      }

                      // debugPrint("leaveType: ${cardData['leaveType']}");
                      // debugPrint("onBehalfId: ${cardData['onBehalfId']}");
                      // debugPrint("leaveName: ${cardData['leaveName']}");
                      // debugPrint("description: ${cardData['description']}");
                      // debugPrint("emergencyCall: ${cardData['emergencyCall']}");
                      // debugPrint("fromDate: ${cardData['fromDate']}");
                      // debugPrint("toDate: ${cardData['toDate']}");
                      // debugPrint("isPaidLeave: ${cardData['isPaidLeave']}");

                      return Slidable(
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
                                  Get.defaultDialog(
                                    title: 'Confirm Deletion',
                                    contentPadding: const EdgeInsets.all(20),
                                    content: Column(
                                      children: [
                                        Text(
                                          "Are you sure you want to delete this leave?",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            OutlinedButton(
                                              onPressed: () => Get.back(),
                                              style: ButtonStyle(
                                                side: MaterialStateProperty
                                                    .resolveWith<BorderSide>(
                                                        (Set<MaterialState>
                                                            states) {
                                                  if (states.contains(
                                                      MaterialState.disabled)) {
                                                    return const BorderSide(
                                                        color: Colors
                                                            .grey); // Adjust the color for disabled state if needed
                                                  }
                                                  return const BorderSide(
                                                      color: Colors
                                                          .blue); // Border color for enabled state
                                                }),
                                              ),
                                              child: const Text(
                                                'NO',
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            OutlinedButton(
                                              style: ButtonStyle(
                                                side: MaterialStateProperty
                                                    .resolveWith<BorderSide>(
                                                  (Set<MaterialState> states) {
                                                    if (states.contains(
                                                        MaterialState
                                                            .disabled)) {
                                                      return const BorderSide(
                                                          color: Colors
                                                              .grey); // Adjust the color for disabled state if needed
                                                    }
                                                    return const BorderSide(
                                                        color: Colors
                                                            .blue); // Border color for enabled state
                                                  },
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.blue),
                                                foregroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white),
                                              ),
                                              onPressed: () {
                                                Get.back();
                                                deleteLeaves(cardData);
                                              },
                                              child: const Text(
                                                'YES',
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
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
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cardData['leaveType']['name'].toString(),
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  )
                                ]),
                            subtitle: Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                HelperWidgets.RowHelper("OnBehalf: ",
                                    "${cardData['onBehalf']['firstName']} ${cardData['onBehalf']['lastName']}"),
                                HelperWidgets.RowHelper(
                                  "Start Date: ",
                                  formattedDate(fromData),
                                ),
                                HelperWidgets.RowHelper(
                                    "Last Date: ", formattedDate(toData)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Is Approved",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Checkbox(
                                        value: cardData['isApproved'],
                                        onChanged: (e) {})
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
      ),
    );
  }
}
