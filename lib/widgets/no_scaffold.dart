import 'package:flutter/material.dart';
import 'package:material_app/utils/constants.dart';

class NoScaffoldScreen extends StatelessWidget {
  const NoScaffoldScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Tap the menu and add new scaffold',
            style: textNormal,
          ),
          Icon(
            Icons.menu,
            size: 50,
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
