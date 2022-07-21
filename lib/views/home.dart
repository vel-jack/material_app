import 'package:flutter/material.dart';
import 'package:material_app/widgets/node_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Material(
              color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  NodeTile(
                    onExpand: () {},
                    title: 'Scaffold ( HomePage )',
                    isExpanded: true,
                    childrens: [
                      NodeTile(
                        onExpand: () {},
                        title: 'AppBar',
                        isSelected: true,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
