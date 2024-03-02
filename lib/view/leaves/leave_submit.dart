import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmapp/controller/globalController.dart';
import 'package:hrmapp/controller/leaveControllers/leaveSubmitController.dart';

class LeaveSubmit extends StatefulWidget {
  const LeaveSubmit({super.key});

  @override
  State<LeaveSubmit> createState() => _LeaveSubmitState();
}

class _LeaveSubmitState extends State<LeaveSubmit> {
  LeaveSubmitController leaveSubmitController =
      Get.put(LeaveSubmitController());
  GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Obx(() => SingleChildScrollView(
        child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Leaves",
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: Get.height * 0.05),
                  DropdownButtonFormField(
                    decoration:
                        const InputDecoration(labelText: "Select Prioritat"),
                    value:
                        leaveSubmitController.priorityDropdownOptions.isNotEmpty
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
                      leaveSubmitController.priority.value = newValue.toString();
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
                    decoration: const InputDecoration(labelText: "Select Type"),
                    value:
                        leaveSubmitController.leaveTypeDropdownOptions.isNotEmpty
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
                      leaveSubmitController.todoType.value = newValue.toString();
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
                    decoration: const InputDecoration(label: Text("Start Date")),
                    onTap: () {
                      globalController.selectDate(
                          context, leaveSubmitController.fromDate.value);
                    },
                    // validator: RequiredValidator(errorText: "Required"),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "To Date",
                    ),
                  ),
                  SizedBox(height: Get.height * 0.03),
                  SizedBox(
                    width: double.infinity,
                    height: Get.height * 0.065,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Done"),
                    ),
                  )
                ],
              ),
            ),
      )),
    );
  }
}
