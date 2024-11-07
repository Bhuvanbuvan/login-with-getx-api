import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:login_screen/views/auth_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () async {
              final SharedPreferences? prefs = await _prefs;
              prefs?.clear();
              Get.offAll(AuthScreen());
            },
            child: Text("logout"),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text("Welcome home"),
            TextButton(
                onPressed: () async {
                  final SharedPreferences prefs = await _prefs;
                },
                child: Text('Print token'))
          ],
        ),
      ),
    );
  }
}
