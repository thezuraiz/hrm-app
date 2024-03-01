import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hrmapp/controller/globalController.dart';
import 'package:hrmapp/controller/todoControllers/todoSubmitController.dart';
import 'package:hrmapp/utils/helperWid.dart';
import 'package:hrmapp/utils/todo_helperWidgets.dart';

class TodoSubmit extends StatefulWidget {
  const TodoSubmit({super.key});

  @override
  State<TodoSubmit> createState() => _TodoSubmitState();
}

class _TodoSubmitState extends State<TodoSubmit> {
  final formKey = GlobalKey<FormState>();
  TodoSubmitController todoSubmitController = Get.put(TodoSubmitController());
  GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todo",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 36),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Form(
            key: formKey,
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.width * 0.025,
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(label: Text("Todo Item")),
                      validator: RequiredValidator(errorText: "Required"),
                      controller: todoSubmitController.itemController.value,
                    ),
                    TodoHelper.SizedWid(),
                    TextFormField(
                      decoration:
                          const InputDecoration(label: Text("Description")),
                      validator: RequiredValidator(errorText: "Required"),
                      controller: todoSubmitController.descController.value,
                    ),
                    TodoHelper.SizedWid(),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField(
                            decoration: const InputDecoration(
                                labelText: "Select Prioritat"),
                            value: todoSubmitController
                                    .priorityDropdownOptions.isNotEmpty
                                ? todoSubmitController
                                    .priorityDropdownOptions.first['text']
                                : "",
                            items: todoSubmitController.priorityDropdownOptions
                                .map((Map item) {
                              return DropdownMenuItem<String>(
                                value: item['value'],
                                child: Text(item['text']),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              // print("New Value: $newValue");
                              todoSubmitController.priority.value =
                                  newValue.toString();
                            },
                            validator: (value){
                              if(value == null || value == ""){
                                return "Required";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(width: Get.width * 0.05),
                        Expanded(
                          child: DropdownButtonFormField(
                            decoration:
                                const InputDecoration(labelText: "Select Type"),
                            value: todoSubmitController
                                    .todoTypeDropdownOptions.isNotEmpty
                                ? todoSubmitController
                                    .todoTypeDropdownOptions.first['text']
                                : "",
                            items: todoSubmitController.todoTypeDropdownOptions
                                .map((Map item) {
                              return DropdownMenuItem<String>(
                                value: item['value'],
                                child: Text(item['text']),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              debugPrint("Dropdown Select: $newValue");
                              todoSubmitController.todoType.value =
                                  newValue.toString();
                            },
                              validator: (value){
                                if(value == null || value == ""){
                                  return "Required";
                                }
                                return null;
                              },
                          ),
                        ),
                      ],
                    ),
                    TodoHelper.SizedWid(),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: todoSubmitController.startDate.value,
                            decoration: const InputDecoration(
                                label: Text("Start Date")),
                            onTap: () {
                              todoSubmitController.selectDate(context,
                                  todoSubmitController.startDate.value);
                            },
                            validator: RequiredValidator(errorText: "Required"),
                            // controller: todoSubmitController.startDate.value,
                          ),
                        ),
                        SizedBox(width: Get.width * 0.05),
                        Expanded(
                          child: TextFormField(
                            controller: todoSubmitController.endDate.value,
                            decoration:
                                const InputDecoration(label: Text("End Date")),
                            onTap: () {
                              todoSubmitController.selectDate(
                                  context, todoSubmitController.endDate.value);
                            },
                            validator: RequiredValidator(errorText: "Required"),
                          ),
                        ),
                      ],
                    ),
                    TodoHelper.SizedWid(),
                    DropdownMenu(
                      label: const Text("Employee"),
                      dropdownMenuEntries: globalController.employeeData.map((value) {
                        return DropdownMenuEntry(
                          label: value['text'].toString(),
                          value: value['value'].toString(),
                        );
                      }).toList(),
                      onSelected: (newValue) {
                        debugPrint("Dropdown Select: $newValue");
                        todoSubmitController.selectedEmplyee.value = newValue.toString();
                      },
                      expandedInsets: const EdgeInsets.all(0),
                    ),
                    TodoHelper.SizedWid(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Is Done? ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        const SizedBox(width: 10),
                        Switch(
                            value: todoSubmitController.isDone.value,
                            onChanged: (value) =>
                                todoSubmitController.isDone.value = value),
                      ],
                    ),
                    TodoHelper.SizedWid(),
                    todoSubmitController.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () {
                                  FocusManager.instance.primaryFocus!.unfocus();
                                  if (!formKey.currentState!.validate()) {
                                    HelperWidgets.Errortoaster(
                                        "Field Required");
                                    return;
                                  }
                                  // todoSubmitController.fetchPriority().obs;
                                  todoSubmitController.submitTodo();
                                },
                                child: const Text("Submit")))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
