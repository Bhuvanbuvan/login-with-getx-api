import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/views/auth_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: AuthScreen(),
    );
  }
}
