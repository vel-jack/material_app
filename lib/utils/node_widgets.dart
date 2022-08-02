// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:material_app/utils/constants.dart';
import 'package:material_app/widgets/node_tile.dart';

Widget mapToWidget(Map<String, dynamic> data) {
  for (final key in data.keys) {
    if (key.contains('w_')) {
      final props = data[key];
      return createWidget(key, props);
    }
  }
  return Container(
    color: Colors.red,
    width: 100,
    height: 50,
  );
}

Widget createWidget(String key, Map<String, dynamic> props) {
  switch (key) {
    case 'w_icon':
      return Icon(
        props['icon'],
        size: props['size'],
        color: props['color'],
      );
    case 'w_text':
      return Text(
        props['text'],
        style: createStyle(props['style']),
        textAlign: props['text_align'],
        overflow: props['overflow'],
      );
  }
  return Text('No widget found for $key');
}

Widget createLayout(String key, Map<String, dynamic> props) {
  switch (key) {
    case 'w_container':
      return Container(
        width: props['width'],
        height: props['height'],
        decoration: createDecoration(props['decoration']),
        child: mapToWidget(props['child']['style']),
      );
    case 'w_center':
      return Center(
        child: mapToWidget(props['child']),
      );
  }
  return Text('No layout found for $key');
}

TextStyle createStyle(Map<String, dynamic> style) {
  return TextStyle(
    color: style['color'],
    fontSize: style['font_size'],
    fontWeight: style['font_weight'],
  );
}

BoxDecoration createDecoration(Map<String, dynamic> decoration) {
  return BoxDecoration(
    color: decoration['color'],
  );
}

List<NodeTile> getChildrenNodeTile(
  List<Map<String, dynamic>> listMap,
  String path,
  context,
) {
  return List.generate(listMap.length, (index) {
    final nodePath =
        listMap.length > 1 ? '$path.children.$index.' : '$path.child.';
    return mapToNodeTile(listMap[index], nodePath, context);
  });
  // return listMap.map((e) => mapToNodeTile(e, path, context)).toList();
  // return [];
}

NodeTile mapToNodeTile(Map<String, dynamic> map, String parentPath, context) {
  final node = map[map.keys.first];
  final haveChild = node.containsKey('child') || node.containsKey('children');

  return NodeTile(
    title: node['name'],
    path: '$parentPath${map.keys.first}',
    icon: map.keys.first == 'w_text' ? Icons.title : null,
    onPropsClicked: (path) {
      propsController.propPath.value = path;
      Scaffold.of(context).openEndDrawer();
    },
    children: haveChild
        ? node.containsKey('child')
            ? getChildrenNodeTile(
                [node['child']], '$parentPath${map.keys.first}', context)
            : getChildrenNodeTile(
                node['children'], '$parentPath${map.keys.first}', context)
        : [],
  );
}
