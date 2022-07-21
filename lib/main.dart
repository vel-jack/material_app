import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_app/views/responsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(),
    );
  }
}
