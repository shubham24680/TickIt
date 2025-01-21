import 'package:flutter/material.dart';
import 'package:glare/features/view_model/text_field.dart';
import 'package:glare/features/view_model/home_provider.dart';
import 'package:provider/provider.dart';

class Edit extends StatelessWidget {
  const Edit({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeProvider prov = Provider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              prov.createTask(prov.taskController.text);
              prov.taskController.clear();
              Navigator.pop(context);
            },
            icon: Icon(Icons.done_rounded),
          ),
        ],
      ),
      body: Editor(taskController: prov.taskController),
    );
  }
}
