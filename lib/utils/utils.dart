import 'package:flutter/material.dart';
import 'package:material_app/utils/constants.dart';

Future<String?> showInput(context) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    builder: (builder) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: TextField(
          autofocus: true,
          style: textNormal,
          decoration: const InputDecoration(border: OutlineInputBorder()),
          onSubmitted: (val) {
            Navigator.pop(context, val);
          },
        ),
      ),
    ),
  );
}
