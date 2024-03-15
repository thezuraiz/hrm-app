import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hrmapp/controller/documentControllers/documentController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:hrmapp/view/documents/addDocument.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/globalController.dart';
import '../../utils/helperWid.dart';
import 'package:http/http.dart' as http;

class DocumentApi extends StatefulWidget {
  const DocumentApi({super.key});

  @override
  State<DocumentApi> createState() => _DocumentApiState();
}

class _DocumentApiState extends State<DocumentApi> {
  DocumentController documentController = Get.put(DocumentController());

  @override
  void initState() {
    // TODO: implement initState
    documentController.fetchDocuments();
    documentController.fetchDocumentTypes();
    super.initState();
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
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 20),
        child: Obx(() => Visibility(
              visible: documentController.loadingDocuments.isFalse,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: Visibility(
                visible: documentController.documents.value.isNotEmpty,
                replacement: Center(child: Text("No Documents",style: Theme.of(context).textTheme.displaySmall,),),
                child: ListView.builder(
                  itemCount: documentController.documents.value.length,
                  itemBuilder: (context, index) {
                    final cardData = documentController.documents.value[index];
                    return Slidable(
                      startActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20),
                            autoClose: true,
                            icon: CupertinoIcons.cloud_download,
                            label: "Download",
                            onPressed: (context) =>
                                documentController.downloadFile(cardData),
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          // SlidableAction(
                          //     backgroundColor: Colors.greenAccent,
                          //     borderRadius: const BorderRadius.only(
                          //         topLeft: Radius.circular(20),
                          //         bottomLeft: Radius.circular(20)),
                          //     autoClose: true,
                          //     icon: Icons.edit,
                          //     label: "Edit",
                          //     onPressed: (context) {
                          //       // String createdById =
                          //       // content['createdById'];
                          //       // String createdAtUtc =
                          //       // content['createdAtUtc'];
                          //       // String updatedById =
                          //       // content['updatedById'];
                          //       // String updatedAtUtc =
                          //       // content['updatedAtUtc'];
                          //       // String todoId = content['todoId'];
                          //       // String todoItem = content['todoItem'];
                          //       // String description =
                          //       // content['description'];
                          //       // bool isDone = content['isDone'];
                          //       // String todoTypeId =
                          //       // content['todoTypeId'];
                          //       // String startDate =
                          //       // content['startDate'];
                          //       // String endDate = content['endDate'];
                          //       // String onBehalfId =
                          //       // content['onBehalfId'];
                          //       // String todoPriorityId =
                          //       // content['todoPriorityId'];
                          //     }),
                          SlidableAction(
                              backgroundColor: Colors.red,
                              autoClose: true,
                              icon: Icons.delete,
                              label: "Remove",
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              onPressed: (context)async {
                                documentController.deleteDocument(cardData);
                              },
                          )
                        ],
                      ),
                      child: Card(
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          subtitle: Column(
                            children: [
                              HelperWidgets.RowHelper(
                                  "Document: ", "${cardData['documentName']}"),
                              HelperWidgets.RowHelper("Document Type: ",
                                  "${cardData['documentType']['name']}"),
                              HelperWidgets.RowHelper("Employee: ",
                                  "${cardData['employee']['firstName']} ${cardData['employee']['lastName']}"),
                              HelperWidgets.RowHelper("Created On: ",
                                  "${documentController.formattedDate(cardData['updatedAtUtc'].toString())}"),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddDocument());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
