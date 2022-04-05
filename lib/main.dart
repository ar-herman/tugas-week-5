import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas/injector/injector.dart';
import 'package:tugas/page/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginScreen(),
      initialBinding: Injector(),
    );
  }
}
