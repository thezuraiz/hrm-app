import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hrmapp/controller/todoControllers/todoController.dart';
import 'package:hrmapp/utils/helperWid.dart';
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
    todoController.fetchData();
    todoController.fetchPriority();
    todoController.fetchTodoType();
    super.initState();
  }

  TodoController todoController = Get.put(TodoController());

  deleteTask(Map todo) async {
    final todoData = {
      "createdById": todo['createdById'],
      "createdAtUtc": todo['createdAtUtc'],
      "updatedById": todo['updatedById'],
      "updatedAtUtc": todo['updatedAtUtc'],
      "todoId": todo['todoId'],
      "todoItem": todo['todoItem'],
      "description": todo['description'],
      "isDone": todo['isDone'],
      "todoTypeId": todo['todoTypeId'],
      "startDate": todo['startDate'],
      "endDate": todo['endDate'],
      "onBehalfId": todo['onBehalfId'],
      "todoPriorityId": todo['todoPriorityId']
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
      final data = jsonDecode(response.body);
      if (response.statusCode == 200) {

        // debugPrint("Form Submitted: $data");
        if (data['isSuccess']) {
          final filteredTodoes = todoController.todos.value
              .where((element) => element['todoId'] != todo['todoId'])
              .toList();
          todoController.todos.value = filteredTodoes;
          HelperWidgets.Greentoaster("Todo Deleted!");
        } else {
          HelperWidgets.Errortoaster("Something Wents Wrong!");
        }
      } else {
        HelperWidgets.Errortoaster("Request Failed!");
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
      body: Obx(() => Visibility(
            visible: !todoController.loadingTodo.value,
            replacement: const Center(
              child: CircularProgressIndicator(),
            ),
            child: Visibility(
              visible: todoController.todos.value.isNotEmpty,
              replacement: Center(
                  child: Text(
                "No Todoes",
                style: Theme.of(context).textTheme.displayMedium,
              )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                    itemCount: todoController.todos.value.length,
                    itemBuilder: (_c, i) {
                      final todo = todoController.todos.value[i] as Map;
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
                                Get.defaultDialog(
                                  title: 'Confirm Deletion',
                                  titlePadding: const EdgeInsets.only(top: 15),
                                  contentPadding: const EdgeInsets.only(
                                      left: 20, right: 20, top: 10),
                                  content: Column(
                                    children: [
                                      Text(
                                        "Are you sure you want to delete this todo?",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      const SizedBox(
                                        height: 8,
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
                                                (Set<MaterialState> states) {
                                                  if (states.contains(
                                                      MaterialState.disabled)) {
                                                    return const BorderSide(
                                                        color: Colors
                                                            .grey); // Adjust the color for disabled state if needed
                                                  }
                                                  return const BorderSide(
                                                      color: Colors
                                                          .blue); // Border color for enabled state
                                                },
                                              ),
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
                                                      MaterialState.disabled)) {
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
                                              deleteTask(todo);
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
                              },
                            ),
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                    )
                                  ]),
                              subtitle: Column(
                                children: [
                                  HelperWidgets.RowHelper("Priority: ",
                                      "${todo['todoPriority']['name']}"),
                                  HelperWidgets.RowHelper(
                                      "Type: ", "${todo['todoType']['name']}"),
                                  HelperWidgets.RowHelper("OnBehalf: ",
                                      "${todo['onBehalf']['firstName']}"),
                                  HelperWidgets.RowHelper(
                                      "Start Date: ", formattedDate),
                                  HelperWidgets.RowHelper("IsDone: ",
                                      todo['isDone'] ? "Done" : "Not Done"),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "IsDone",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Checkbox(
                                          value: todo['isDone'],
                                          onChanged: (e) => !todo['isDone'])
                                    ],
                                  )
                                ],
                              )),
                        ),
                      );
                    }),
              ),
            ),
          )),
    );
  }
}
