import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_app/utils/constants.dart';
import 'package:material_app/utils/node_widgets.dart';
import 'package:material_app/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> pages = [];
  int currentPage = 0;
  final _random = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: pages.isEmpty
              ? const Text('Material App')
              : Text(pages[currentPage]),
        ),
        drawer: buildDrawer(context),
        body: jsonToWidget(json));
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.app_shortcut),
            title: const Text(
              'New Scaffold',
              style: textNormal,
            ),
            trailing: const Icon(Icons.add),
            onTap: () {
              final r = _random.nextInt(1000);
              setState(() {
                pages.add('Scaffold_$r');
              });
            },
          ),
          const Divider(
            thickness: 2,
          ),
          ...[
            for (var i = 0; i < pages.length; i++)
              ListTile(
                leading: const Icon(Icons.smartphone),
                title: Text(
                  pages[i],
                  style: const TextStyle(fontSize: 16),
                ),
                onTap: () {
                  setState(() {
                    currentPage = i;
                  });
                  Navigator.pop(context);
                },
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          showInput(context).then((value) {
                            if (value != null) {
                              if (value.isEmpty) return;
                              setState(() {
                                pages[currentPage] = value;
                              });
                            }
                          });
                        },
                        icon: const Icon(Icons.edit)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            pages.removeAt(i);
                          });
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                ),
              ),
          ]
        ],
      ),
    );
  }
}
