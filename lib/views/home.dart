import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:material_app/utils/constants.dart';
import 'package:material_app/utils/node_widgets.dart';
import 'package:material_app/utils/utils.dart';

final data = {
  'l_column': {
    'name': 'Column',
    'children': [
      {
        'w_text': {
          'name': 'Text',
          'text': 'Helo',
        }
      },
      {
        'w_text': {
          'name': 'Text',
          'text': 'Hola',
        }
      },
      {
        'w_text': {
          'name': 'Text',
          'text': 'Bye',
        }
      },
      {
        'l_center': {
          'name': 'Center',
          'child': {
            'w_text': {
              'name': 'Text',
              'text': 'Hello there!',
            }
          }
        }
      },
      {
        'l_row': {
          'name': 'Row',
          'children': [
            {
              'w_text': {
                'name': 'Text',
                'text': 'Long Nested 1',
              },
            },
            {
              'w_text': {
                'name': 'Text',
                'text': 'Long Nested 2',
              },
            }
          ]
        }
      }
    ]
  }
};

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
      endDrawer: Drawer(
        child: Obx(() {
          return propsController.props.isNotEmpty
              ? ListView.builder(
                  itemCount: propsController.props.length,
                  itemBuilder: (BuildContext context, int index) {
                    final node = propsController.props[index];
                    return ListTile(
                      title: Text(node['name']),
                    );
                  },
                )
              : Container(
                  color: Colors.red,
                );
        }),
      ),
      body: Builder(builder: (context) {
        return mapToNodeTile(data, '', context);
      }),
    );
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
