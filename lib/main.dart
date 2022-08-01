import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_app/props_controller.dart';
import 'package:material_app/views/home.dart';

void main() {
  Get.put(PropsController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
