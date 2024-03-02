import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hrmapp/utils/helperWid.dart';
import 'package:hrmapp/view/leaves/leave_screen.dart';
import 'package:hrmapp/view/todo/todo_page.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

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
                  "Hilda.Haynes@leaves-hrm.com",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  child: Icon(
                    Icons.person_outline,
                    size: 60,
                  ),
                ),
                currentAccountPictureSize: Size.square(85),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        "Urlaub",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      trailing: Icon(CupertinoIcons.airplane),
                      onTap: () => Get.to(const TodoPage()),
                    ),
                    Divider(),
                    ListTile(
                      leading: Text(
                        "Aufgaben",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      trailing: Icon(CupertinoIcons.alarm),
                      onTap: () => HelperWidgets.Errortoaster(
                          "Module Under Developement"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Text(
                        "Dokumente",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      trailing: Icon(CupertinoIcons.add_circled),
                      onTap: () => HelperWidgets.Errortoaster(
                          "Module Under Developement"),
                    ),
                    Divider(),
                    ListTile(
                      leading: Text(
                        "Sign Out",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      trailing: Icon(Icons.logout_outlined),
                      onTap: () => HelperWidgets.Errortoaster(
                          "Module Under Developement"),
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
                            style: Theme.of(context).textTheme.displayMedium,
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
                      onTap: () => Get.to(LeaveScreen()),
                      child: Container(
                        height: Get.height * 0.235,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.purpleAccent,
                        ),
                        child: Center(
                          child: Text(
                            "Aufgaben",
                            style: Theme.of(context).textTheme.displayMedium,
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
                onTap: () =>
                    HelperWidgets.Errortoaster("Module Under Developement"),
                child: Container(
                  height: Get.height * 0.235,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.greenAccent,
                  ),
                  child: Center(
                    child: Text(
                      "Dokumente",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
