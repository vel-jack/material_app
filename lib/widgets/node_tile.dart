// import 'package:flutter/material.dart';
// import 'package:material_app/utils/constants.dart';

// class NodeTile extends StatelessWidget {
//   const NodeTile({
//     Key? key,
//     required this.title,
//     this.onExpand,
//     this.isExpanded = false,
//     this.childrens = const [],
//     this.isSelected = false,
//     this.leading = Icons.child_care,
//   }) : super(key: key);
//   final bool isExpanded;
//   final VoidCallback? onExpand;
//   final String title;
//   final List<NodeTile> childrens;
//   final bool isSelected;
//   final IconData leading;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             childrens.isNotEmpty
//                 ? IconButton(
//                     onPressed: onExpand,
//                     icon: Icon(isExpanded
//                         ? Icons.keyboard_arrow_down
//                         : Icons.keyboard_arrow_right))
//                 : IconButton(onPressed: null, icon: Icon(leading)),
//             TextButton(
//                 style: TextButton.styleFrom(alignment: Alignment.centerLeft),
//                 onPressed: () {},
//                 child: Text(
//                   title,
//                   textAlign: TextAlign.start,
//                   style: isSelected
//                       ? nodeSelected
//                       : isExpanded
//                           ? nodeExpanded
//                           : nodeNormal,
//                 ))
//           ],
//         ),
//         if (isExpanded)
//           Padding(
//             padding: const EdgeInsets.only(left: 20),
//             child: Column(
//               children: childrens
//                   .map((tile) => NodeTile(
//                         onExpand: tile.onExpand,
//                         title: tile.title,
//                         childrens: tile.childrens,
//                         isExpanded: tile.isExpanded,
//                         isSelected: tile.isSelected,
//                       ))
//                   .toList(),
//             ),
//           )
//       ],
//     );
//   }
// }
