import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hrmapp/controller/globalController.dart';
import 'package:hrmapp/controller/leaveControllers/leaveController.dart';

class LeaveSubmit extends StatefulWidget {
  const LeaveSubmit({super.key});

  @override
  State<LeaveSubmit> createState() => _LeaveSubmitState();
}

class _LeaveSubmitState extends State<LeaveSubmit> {
  LeaveController leaveSubmitController = Get.put(LeaveController());
  GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create Leave",
                      style:
                          TextStyle(fontSize: 42, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: Get.height * 0.05),
                    DropdownButtonFormField(
                      decoration:
                          const InputDecoration(labelText: "Select Prioritat"),
                      value: leaveSubmitController
                              .priorityDropdownOptions.isNotEmpty
                          ? leaveSubmitController
                              .priorityDropdownOptions.first['text']
                          : "",
                      items: leaveSubmitController.priorityDropdownOptions
                          .map((Map item) {
                        return DropdownMenuItem<String>(
                          value: item['value'],
                          child: Text(item['text']),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        // print("New Value: $newValue");
                        leaveSubmitController.priority.value =
                            newValue.toString();
                      },
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: Get.height * 0.03),
                    DropdownButtonFormField(
                      decoration:
                          const InputDecoration(labelText: "Select Type"),
                      value: leaveSubmitController
                              .leaveTypeDropdownOptions.isNotEmpty
                          ? leaveSubmitController
                              .leaveTypeDropdownOptions.first['text']
                          : "",
                      items: leaveSubmitController.leaveTypeDropdownOptions
                          .map((Map item) {
                        return DropdownMenuItem<String>(
                          value: item['value'],
                          child: Text(item['text']),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        debugPrint("Dropdown Select: $newValue");
                        leaveSubmitController.leaveType.value =
                            newValue.toString();
                      },
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: Get.height * 0.03),
                    TextFormField(
                      controller: leaveSubmitController.fromDate.value,
                      decoration:
                          const InputDecoration(label: Text("Start Date")),
                      onTap: () {
                        globalController.selectDate(
                            context, leaveSubmitController.fromDate.value);
                      },
                      validator: RequiredValidator(errorText: "Required"),
                      keyboardType: TextInputType.none,
                    ),
                    SizedBox(height: Get.height * 0.03),
                    TextFormField(
                      controller: leaveSubmitController.toDate.value,
                      decoration: const InputDecoration(label: Text("To Date")),
                      onTap: () {
                        globalController.selectDate(
                            context, leaveSubmitController.toDate.value);
                      },
                      validator: RequiredValidator(errorText: "Required"),
                      keyboardType: TextInputType.none,
                    ),
                    SizedBox(height: Get.height * 0.03),
                    SizedBox(
                      width: double.infinity,
                      height: Get.height * 0.065,
                      child: leaveSubmitController.loading.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ElevatedButton(
                              onPressed: () {
                                FocusManager.instance.primaryFocus!.unfocus();
                                if (formKey.currentState!.validate()) {
                                  leaveSubmitController.leaveSubmit();
                                }
                              },
                              child: const Text("Done"),
                            ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
