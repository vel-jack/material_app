import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:material_app/ext/color_picker.dart';
import 'package:material_app/ext/text_editor.dart';
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
          'color': 'red',
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
        actions: const [
          // IconButton(onPressed: () {}, icon: const Icon(Icons.play_arrow))
        ],
      ),
      drawer: buildDrawer(context),
      endDrawerEnableOpenDragGesture: false,
      endDrawer: Drawer(
        child: Obx(() {
          if (propsController.props.isNotEmpty) {
            return EndDrawer(props: propsController.props);
          } else {
            return Container(
              color: Colors.red,
            );
          }
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

class EndDrawer extends StatelessWidget {
  const EndDrawer({Key? key, required this.props}) : super(key: key);
  final Map<String, dynamic> props;

  @override
  Widget build(BuildContext context) {
    title(title) => Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            Scaffold.of(context).closeEndDrawer();
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: props.keys.map((key) {
                if (key == 'name') {
                  return title(props['name']);
                }
                if (key == 'text') {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => TextEditor(
                                    text: '${props['text']}',
                                  ))).then((value) {
                        if (value != null) {
                          debugPrint(value);
                        }
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Text',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${props['text']}',
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  );
                }
                if (key == 'color') {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => ColorPicker()))
                          .then((value) {
                        if (value != null) {
                          debugPrint(value);
                        }
                      });
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Color',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${props['color']}',
                          style: const TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  );
                }
                return Text('${props[key]}');
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
