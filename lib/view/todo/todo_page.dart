import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hrmapp/utils/helperWid.dart';
import 'package:hrmapp/utils/todo_helperWidgets.dart';
import 'package:hrmapp/view/todo/todo_submit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import '../../controller/globalController.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  List todos = [];
  bool isLoading = true;

  Future<void> fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    debugPrint("Token in : $token");
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
        setState(() {
          todos = result;
        });

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
    setState(() {
      isLoading = false;
    });
  }

  deleteTask(
      String createdById,
      createdAtUtc,
      updatedById,
      updatedAtUtc,
      todoId,
      todoItem,
      description,
      isDone,
      todoTypeId,
      startDate,
      endDate,
      onBehalfId,
      todoPriorityId) async {
    final todoData = {
      "createdById": createdById,
      "createdAtUtc": createdAtUtc,
      "updatedById": updatedById,
      "updatedAtUtc": updatedAtUtc,
      "todoId": todoId,
      "todoItem": todoItem,
      "description": description,
      "isDone": isDone,
      "todoTypeId": todoTypeId,
      "startDate": startDate,
      "endDate": endDate,
      "onBehalfId": onBehalfId,
      "todoPriorityId": todoPriorityId
    };

    const url = "${GlobalController.baseUrl}/TodoApi/Delete";
    final token = await SharedPreferences.getInstance()
        .then((prefs) => prefs.getString("token"));
    final headers = {
      'Content-Type': 'application/json-patch+json',
      'Accept': 'application/json',
      'Authorization': "Bearer $token"
    };
    try {
      final response = await http.post(Uri.parse(url),
          headers: headers, body: jsonEncode(todoData));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        debugPrint("Form Submitted: $data");
        if (data['isSuccess']) {
          setState(() {
            fetchData();
          });
          HelperWidgets.Greentoaster("Todo Deleted!");
        } else {
          HelperWidgets.Errortoaster("Something Wents Wrong!");
        }
      } else {
        final data = jsonDecode(response.body);
        Get.snackbar("Error", data['errors'].toString());
      }
    } catch (e) {
      debugPrint("Failed to submit form: $e");
      Get.snackbar("Error", "Failed to submit form. Please try again later.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo",
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => Get.to(const TodoSubmit()),
      ),
      body: Visibility(
        visible: isLoading,
        replacement: RefreshIndicator(
          onRefresh: () => fetchData(),
          child: Visibility(
            visible: todos.isNotEmpty,
            replacement: Center(
                child: Text(
              "No Todoes",
              style: Theme.of(context).textTheme.displayMedium,
            )),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (_c, i) {
                    final todo = todos[i] as Map;
                    // debugPrint("Card Data ${todo.toString()}");
                    DateTime originalDate =
                        DateTime.parse(todo['startDate'].toString());
                    String formattedDate = DateFormat('dd-MM-yyyy')
                        .format(originalDate)
                        .toString();
                    return Slidable(
                      key: ValueKey(todo['todoType']['name']),
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
                                String createdById = todo['createdById'];
                                String createdAtUtc = todo['createdAtUtc'];
                                String updatedById = todo['updatedById'];
                                String updatedAtUtc = todo['updatedAtUtc'];
                                String todoId = todo['todoId'];
                                String todoItem = todo['todoItem'];
                                String description = todo['description'];
                                bool isDone = todo['isDone'];
                                String todoTypeId = todo['todoTypeId'];
                                String startDate = todo['startDate'];
                                String endDate = todo['endDate'];
                                String onBehalfId = todo['onBehalfId'];
                                String todoPriorityId = todo['todoPriorityId'];
                                deleteTask(
                                    createdById,
                                    createdAtUtc,
                                    updatedById,
                                    updatedAtUtc,
                                    todoId,
                                    todoItem,
                                    description,
                                    isDone,
                                    todoTypeId,
                                    startDate,
                                    endDate,
                                    onBehalfId,
                                    todoPriorityId);
                              })
                        ],
                      ),
                      child: Card(
                        child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            leading: CircleAvatar(
                              child: Text("${i + 1}"),
                            ),
                            title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    todo['todoItem'].toString(),
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  )
                                ]),
                            subtitle: Column(
                              children: [
                                TodoHelper.RowHelper("Priority: ",
                                    "${todo['todoPriority']['name']}"),
                                TodoHelper.RowHelper(
                                    "Type: ", "${todo['todoType']['name']}"),
                                TodoHelper.RowHelper("OnBehalf: ",
                                    "${todo['onBehalf']['firstName']}"),
                                TodoHelper.RowHelper(
                                    "Start Date: ", formattedDate),
                                TodoHelper.RowHelper("IsDone: ",
                                    todo['isDone'] ? "Done" : "Not Done"),
                              ],
                            )),
                      ),
                    );
                  }),

              // child: Column(
              //   children: [
              //     FutureBuilder(
              //       future: fetchData(),
              //       builder: (context, snapshot) {
              //         if (snapshot.connectionState == ConnectionState.done) {
              //           if (snapshot.hasError) {
              //             return Center(
              //               child: Text(snapshot.error.toString()),
              //             );
              //           } else if (snapshot.hasData) {
              //             return Expanded(
              //               child: ListView.builder(
              //                 itemCount: snapshot.data!['data'].length,
              //                 itemBuilder: (context, index) {
              //                   final content = snapshot.data!['data'][index];
              //                   // debugPrint("Card Data ${content.toString()}");
              //                   DateTime originalDate =
              //                       DateTime.parse(content['startDate'].toString());
              //                   String formattedDate = DateFormat('dd-MM-yyyy')
              //                       .format(originalDate)
              //                       .toString();
              //                   return Slidable(
              //                     key: ValueKey(content['todoType']['name']),
              //                     endActionPane: ActionPane(
              //                       motion: const ScrollMotion(),
              //                       children: [
              //                         SlidableAction(
              //                             backgroundColor: Colors.red,
              //                             borderRadius: BorderRadius.circular(20),
              //                             autoClose: true,
              //                             icon: Icons.delete,
              //                             label: "Remove",
              //                             onPressed: (context) {
              //                               String createdById =
              //                                   content['createdById'];
              //                               String createdAtUtc =
              //                                   content['createdAtUtc'];
              //                               String updatedById =
              //                                   content['updatedById'];
              //                               String updatedAtUtc =
              //                                   content['updatedAtUtc'];
              //                               String todoId = content['todoId'];
              //                               String todoItem = content['todoItem'];
              //                               String description =
              //                                   content['description'];
              //                               bool isDone = content['isDone'];
              //                               String todoTypeId =
              //                                   content['todoTypeId'];
              //                               String startDate = content['startDate'];
              //                               String endDate = content['endDate'];
              //                               String onBehalfId =
              //                                   content['onBehalfId'];
              //                               String todoPriorityId =
              //                                   content['todoPriorityId'];
              //                               deleteTask(
              //                                   createdById,
              //                                   createdAtUtc,
              //                                   updatedById,
              //                                   updatedAtUtc,
              //                                   todoId,
              //                                   todoItem,
              //                                   description,
              //                                   isDone,
              //                                   todoTypeId,
              //                                   startDate,
              //                                   endDate,
              //                                   onBehalfId,
              //                                   todoPriorityId);
              //                               setState(() {});
              //                             })
              //                       ],
              //                     ),
              //                     child: Card(
              //                       child: ListTile(
              //                           contentPadding: const EdgeInsets.symmetric(
              //                               horizontal: 15, vertical: 8),
              //                           leading: CircleAvatar(
              //                             child: Text("${index + 1}"),
              //                           ),
              //                           title: Row(
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.center,
              //                               children: [
              //                                 Text(
              //                                   content['todoItem'].toString(),
              //                                   style: Theme.of(context)
              //                                       .textTheme
              //                                       .titleLarge,
              //                                 )
              //                               ]),
              //                           subtitle: Column(
              //                             children: [
              //                               TodoHelper.RowHelper("Priority: ",
              //                                   "${content['todoPriority']['name']}"),
              //                               TodoHelper.RowHelper("Type: ",
              //                                   "${content['todoType']['name']}"),
              //                               TodoHelper.RowHelper("OnBehalf: ",
              //                                   "${content['onBehalf']['firstName']}"),
              //                               TodoHelper.RowHelper(
              //                                   "Start Date: ", formattedDate),
              //                               TodoHelper.RowHelper(
              //                                   "IsDone: ",
              //                                   content['isDone']
              //                                       ? "Done"
              //                                       : "Not Done"),
              //                             ],
              //                           )),
              //                     ),
              //                   );
              //                 },
              //               ),
              //             );
              //           } else {
              //             return SizedBox(
              //               height: Get.height * 0.8,
              //               child: const Center(
              //                 child: CircularProgressIndicator(),
              //               ),
              //             );
              //           }
              //         } else {
              //           return SizedBox(
              //             height: Get.height * 0.8,
              //             child: const Center(
              //               child: CircularProgressIndicator(),
              //             ),
              //           );
              //         }
              //       },
              //     ),
              //   ],
              // ),
            ),
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
