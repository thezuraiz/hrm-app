import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hrmapp/utils/helperWid.dart';
import 'package:hrmapp/utils/todo_helperWidgets.dart';

class TodoSubmit extends StatefulWidget {
  const TodoSubmit({super.key});

  @override
  State<TodoSubmit> createState() => _TodoSubmitState();
}

class _TodoSubmitState extends State<TodoSubmit> {
  final formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();

  void selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2024),
      lastDate: DateTime(2030),
    );
    if (newDate != null) {
        date = newDate;
    }
  }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(label: Text("Todo Item")),
                  validator: RequiredValidator(errorText: "Required"),
                ),
                TodoHelper.SizedWid(),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Description")),
                  validator: RequiredValidator(errorText: "Required"),
                ),
                TodoHelper.SizedWid(),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Prioritat")),
                  validator: RequiredValidator(errorText: "Required"),
                ),
                TodoHelper.SizedWid(),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Todo Type")),
                  validator: RequiredValidator(errorText: "Required"),
                ),
                TodoHelper.SizedWid(),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(label: Text("Start Date")),
                        onTap: () {
                          selectDate();
                        },
                        validator: RequiredValidator(errorText: "Required"),
                      ),
                    ),
                    SizedBox(width: Get.width * 0.05),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(label: Text("End Date")),
                        validator: RequiredValidator(errorText: "Required"),
                        onTap: () => selectDate(),
                      ),
                    ),
                  ],
                ),
                TodoHelper.SizedWid(),
                TextFormField(
                  decoration: const InputDecoration(label: Text("Mitarbeiter")),
                  validator: RequiredValidator(errorText: "Required"),
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
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    const SizedBox(width: 10),
                    Switch(value: false, onChanged: (value) {}),
                  ],
                ),
                TodoHelper.SizedWid(),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (!formKey.currentState!.validate()) {
                            HelperWidgets.Errortoaster("Field Required");
                            return;
                          }
                        },
                        child: const Text("Submit")))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
