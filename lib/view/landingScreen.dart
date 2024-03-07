import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmapp/controller/globalController.dart';
import 'package:hrmapp/view/documents/documentApi.dart';
import 'package:hrmapp/view/leaves/leave_screen.dart';
import 'package:hrmapp/view/login_screen.dart';
import 'package:hrmapp/view/todo/todo_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String email = '';
  GlobalController globalController = Get.put(GlobalController());

  @override
  void initState() {
    globalController.onBehalf();
    loadUserEmail().then((value) {
      setState(() {
        email = value ?? '';
      });
    });
    super.initState();
  }


  Future<String?> loadUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userEmail");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Welcome User",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: null,
                accountEmail: Text(
                  email,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                currentAccountPicture: const CircleAvatar(
                  child: Icon(
                    Icons.person_outline,
                    size: 60,
                  ),
                ),
                currentAccountPictureSize: const Size.square(85),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        "Urlaub",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      trailing: const Icon(CupertinoIcons.airplane),
                      onTap: () => Get.to(const TodoPage()),
                    ),
                    const Divider(),
                    ListTile(
                      leading: Text(
                        "Aufgaben",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      trailing: const Icon(CupertinoIcons.alarm),
                      onTap: () => Get.to(const LeaveScreen()),
                    ),
                    const Divider(),
                    ListTile(
                      leading: Text(
                        "Dokumente",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      trailing: const Icon(CupertinoIcons.add_circled),
                      onTap: () => Get.to(const DocumentApi()),
                    ),
                    const Divider(),
                    ListTile(
                      leading: Text(
                        "Sign Out",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      trailing: const Icon(Icons.logout_outlined),
                      onTap: () => Get.offAll(const LoginPage()),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      onTap: () => Get.to(const TodoPage()),
                      child: Container(
                        height: Get.height * 0.235,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.lightBlueAccent,
                        ),
                        child: Center(
                          child: Text(
                            "Urlaub",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.height * 0.02,
                  ),
                  Expanded(
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      onTap: () => Get.to(const LeaveScreen()),
                      child: Container(
                        height: Get.height * 0.235,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.purpleAccent,
                        ),
                        child: Center(
                          child: Text(
                            "Aufgaben",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                onTap: () => Get.to(DocumentApi()),
                child: Container(
                  height: Get.height * 0.235,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.greenAccent,
                  ),
                  child: Center(
                    child: Text(
                      "Dokumente",
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
