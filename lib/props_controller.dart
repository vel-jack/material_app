import 'package:get/get.dart';
import 'package:material_app/views/home.dart';

class PropsController extends GetxController {
  static PropsController instance = Get.find();
  Rx<String> propPath = Rx<String>('');
  Map<String, dynamic> get props {
    Map<String, dynamic> x = {};
    var l = propPath.value.split('.');
    if (l.isNotEmpty) {
      dynamic d;
      for (dynamic i in l) {
        if (i == '') {
          break;
        }
        if (int.tryParse(i) != null) {
          i = int.parse(i);
        }
        if (d == null) {
          d = data[i];
        } else {
          d = d[i];
        }
      }
      if (d != null) {
        for (final key in d.keys) {
          if (key != 'child' && key != 'children') {
            x[key] = d[key];
          }
        }
      }
    }
    return x;
  }
}
