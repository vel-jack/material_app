import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:material_app/views/home.dart';

class PropsController extends GetxController {
  static PropsController instance = Get.find();
  Rx<String> propPath = Rx<String>('');
  Map<String, dynamic> get props {
    var l = propPath.value.split('.');
    debugPrint(propPath.value);
    dynamic d;
    for (dynamic i in l) {
      if (int.tryParse(i) != null) {
        i = int.parse(i);
      }
      if (d == null) {
        d = data[i];
      } else {
        d = d[i];
      }
    }
    Map<String, dynamic> x = {};
    for (final key in d.keys) {
      if (key != 'child' && key != 'children') {
        x[key] = d[key];
      }
    }
    return x;
  }
}
