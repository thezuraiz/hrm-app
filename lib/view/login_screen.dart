import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:hrmapp/controller/globalController.dart';
import 'package:hrmapp/controller/loginController.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Get.height * 0.19),
                Lottie.asset("assets/animations/loginanimation.json",
                    repeat: false, fit: BoxFit.contain, width: 230),
                SizedBox(height: Get.height * 0.1),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  controller: loginController.emailController,
                  validator: MultiValidator(
                    [
                      RequiredValidator(errorText: "Email is required"),
                      EmailValidator(errorText: "Email is not valid"),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Obx(
                  () => TextFormField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.password_outlined),
                      suffixIcon: InkWell(
                        splashColor: Colors.transparent,
                        child: Icon(
                          loginController.showPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onTap: () => loginController.showPassword.toggle(),
                      ),
                    ),
                    obscureText: !loginController.showPassword.value,
                    controller: loginController.passwordController,
                    validator: RequiredValidator(errorText: "Required"),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sign in",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    Obx(
                      () => loginController.isLoading.value
                          ? const CircularProgressIndicator()
                          : IconButton(
                              onPressed: () {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }
                                loginController
                                    .loginApi(GlobalController.baseUrl);
                              },
                              icon: const CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 33,
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
