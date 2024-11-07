import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/controllers/login_controller.dart';
import 'package:login_screen/controllers/registeration_controllers.dart';
import 'package:login_screen/views/widgets/input_field.dart';
import 'package:login_screen/views/widgets/submit_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  RegistrationController registrationController =
      Get.put(RegistrationController());
  LoginController loginController = Get.put(LoginController());
  var isLogin = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(36),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        color: !isLogin.value ? Colors.white : Colors.amber,
                        onPressed: () {
                          isLogin.value = false;
                        },
                        child: Text("Register"),
                      ),
                      MaterialButton(
                        color: isLogin.value ? Colors.white : Colors.amber,
                        onPressed: () {
                          isLogin.value = true;
                        },
                        child: Text("Login"),
                      ),
                    ],
                  ),
                  SizedBox(height: 80),
                  isLogin.value ? loginWidget() : registerMethod()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column registerMethod() {
    return Column(
      children: [
        InputField(
            textEditingController: registrationController.emailController,
            hintText: 'email'),
        InputField(
            textEditingController: registrationController.mobileController,
            hintText: 'mobile Number'),
        InputField(
            textEditingController: registrationController.passwordController,
            hintText: 'password'),
        SizedBox(height: 20),
        SubmitButton(
          onpressed: () => registrationController.registerWithEmail(),
          title: "Register",
        ),
      ],
    );
  }

  Column loginWidget() {
    return Column(
      children: [
        InputField(
            textEditingController: loginController.emailController,
            hintText: 'email'),
        InputField(
            textEditingController: loginController.passwordController,
            hintText: 'password'),
        SizedBox(height: 20),
        SubmitButton(
            onpressed: () => loginController.loginWithEmail(), title: "Login")
      ],
    );
  }
}
