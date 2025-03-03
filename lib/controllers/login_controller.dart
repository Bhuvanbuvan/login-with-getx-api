import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/utils/api_endpoints.dart';
import 'package:login_screen/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.loginEmail);

      Map<String, String> body = {
        'username': emailController.text,
        'password': passwordController.text,
      };
      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);
      print(response.body);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json.toString() + " hello world");

        // Save token if registration is successful
        var token = json['token'];
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', token);

        // Clear the text fields after registration
        emailController.clear();
        passwordController.clear();

        // Navigate to home or show a success message
        Get.snackbar('Success', 'Registration successful');
        Get.offAll(Home());
      } else if (response.statusCode == 400) {
        print("error");
      } else {
        print("error else");
        throw jsonDecode(response.body)['Message'] ?? "Unknown Error Occurred";
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text("Error"),
              contentPadding: EdgeInsets.all(20),
              children: [
                Text(
                  e.toString(),
                ),
              ],
            );
          });
    }
  }
}
