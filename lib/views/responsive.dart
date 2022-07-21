import 'package:flutter/material.dart';
import 'package:material_app/views/home.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1200) {
        return Container(
          color: Colors.white,
          child: const Center(
            child: Text('Please maximize'),
          ),
        );
      }
      return const HomePage();
    });
  }
}
