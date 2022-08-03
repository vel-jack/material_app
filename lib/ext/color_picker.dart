import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  ColorPicker({Key? key}) : super(key: key);
  final kColors = {
    'black': Colors.black,
    'white': Colors.white,
    'red': Colors.red,
    'green': Colors.green,
    'blue': Colors.blue
  };

  @override
  Widget build(BuildContext context) {
    final keys = kColors.keys.toList();
    return Scaffold(
      appBar: AppBar(title: const Text('Pick Color')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          crossAxisCount: 5,
          children: kColors.keys
              .map(
                (k) => GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(1),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: CircleAvatar(
                          backgroundColor: kColors[k],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(k)
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
