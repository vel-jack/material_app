import 'package:flutter/material.dart';
import 'package:material_app/utils/constants.dart';

class NodeTile extends StatefulWidget {
  const NodeTile({
    Key? key,
    required this.title,
    this.onPropsClicked,
    this.childrens = const [],
  }) : super(key: key);
  final String title;
  final List<NodeTile> childrens;
  final VoidCallback? onPropsClicked;

  @override
  State<NodeTile> createState() => _NodeTileState();
}

class _NodeTileState extends State<NodeTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);

  late AnimationController _controller;
  late Animation<double> _iconAnim;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200));
    _iconAnim = _controller.drive(_halfTween);
    _heightFactor = _controller.drive(CurveTween(curve: Curves.easeIn));
    _isExpanded = PageStorage.of(context)?.readState(context) as bool? ?? false;
    if (_isExpanded) _controller.value = 1.0;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: _controller.view,
      builder: (BuildContext context, Widget? child) {
        return Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: _onTap,
                  child: Row(
                    children: [
                      RotationTransition(
                        turns: _iconAnim,
                        child: const Icon(Icons.expand_more),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0).copyWith(right: 50),
                        child: Text(
                          widget.title,
                          style: textNormal,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: widget.onPropsClicked,
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.grey,
                    ))
              ],
            ),
            ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                heightFactor: _heightFactor.value,
                child: child,
              ),
            )
          ],
        );
      },
      child: Offstage(
        offstage: closed,
        child: TickerMode(
          enabled: !closed,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: widget.childrens,
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    PageStorage.of(context)?.writeState(context, _isExpanded);
  }
}
