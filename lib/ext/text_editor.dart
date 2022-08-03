import 'package:flutter/material.dart';

class TextEditor extends StatefulWidget {
  const TextEditor({Key? key, this.text = '', this.isMultiline = false})
      : super(key: key);
  final String text;
  final bool isMultiline;
  @override
  State<TextEditor> createState() => _TextEditorState();
}

class _TextEditorState extends State<TextEditor> {
  final _controller = TextEditingController();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.text = widget.text;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context, _controller.text);
            },
            icon: const Icon(Icons.done),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _controller,
          autofocus: true,
          onFieldSubmitted: (val) {},
          maxLines: widget.isMultiline ? null : 1,
          textInputAction: widget.isMultiline ? TextInputAction.newline : null,
          style: const TextStyle(
            fontSize: 20,
          ),
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
