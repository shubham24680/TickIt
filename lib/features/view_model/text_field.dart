import 'package:flutter/material.dart';

class Editor extends StatefulWidget {
  const Editor({super.key, required this.taskController});

  final TextEditingController taskController;

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: widget.taskController,
        maxLines: 10,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
