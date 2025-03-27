import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tickit/core/utils/app_colors.dart';
import 'package:tickit/features/view_model/providers/task_provider.dart';

class Editor extends StatefulWidget {
  const Editor({super.key});

  @override
  State<Editor> createState() => _EditorState();
}

class _EditorState extends State<Editor> {
  TextStyle style(Color color) {
    return GoogleFonts.inter(
      color: color,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }

  @override
  Widget build(BuildContext context) {
    final TaskProvider prov = Provider.of(context);
    return TextField(
      onChanged: (value) {
        prov.onChanged(value.isNotEmpty);
      },
      controller: prov.taskController,
      maxLines: 50,
      cursorColor: black,
      style: style(black),
      decoration: InputDecoration(
        hintText: "Write a new task...",
        hintStyle: style(grey),
        border: InputBorder.none,
      ),
    );
  }
}
