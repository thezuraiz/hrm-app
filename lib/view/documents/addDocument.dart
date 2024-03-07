import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmapp/controller/documentControllers/documentController.dart';
import 'package:hrmapp/utils/helperWid.dart';

class AddDocument extends StatefulWidget {
  const AddDocument({super.key});

  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {

  DocumentController documentController = Get.put(DocumentController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Document",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: SizedBox(
            height: Get.height * 0.8,
            child: Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButtonFormField(
                  decoration:
                  const InputDecoration(labelText: "Select Prioritat"),
                  value: documentController.documentTypes.isNotEmpty
                      ? documentController.documentTypes.first['text']
                      : null,
                  items: documentController.documentTypes.map((Map item) {
                    return DropdownMenuItem<String>(
                      value: item['value'],
                      child: Text(item['text']),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    debugPrint("New Value: $newValue");
                    documentController.selectedDocumentType.value =
                        newValue.toString();
                  },
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Required";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SizedBox(
                  width: double.infinity,
                  height: Get.height * 0.06,
                  child: OutlinedButton(
                    onPressed: () {
                      documentController.setFile();
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                    ),
                    child: const Text(
                      "Choose File",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                SizedBox(
                    width: double.infinity,
                    height: Get.height * 0.06,
                    child: documentController.formLoading.value
                        ? const Center(child: CircularProgressIndicator(),)
                        : ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (documentController.file.value.path.isEmpty) {
                              HelperWidgets.Errortoaster("File Required");
                              return;
                            }
                            documentController.addDocument();
                          }


                        },
                        child: const Text("Save")))
              ],
            )),
          ),
        ),
      ),
    );
  }
}
