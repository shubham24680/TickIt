import 'package:flutter/material.dart';
import 'package:glare/core/utils/app_colors.dart';
import 'package:glare/features/model/task.dart';
import 'package:provider/provider.dart';

import 'package:glare/core/utils/app_icons.dart';
import 'package:glare/core/widgets/text.dart';
import 'package:glare/features/view_model/home_provider.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final HomeProvider prov = Provider.of(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => prov.changeCheckBox(task, !task.isCompleted),
                child: task.isCompleted
                    ? Svgs(image: "assets/icons/checkbox_checked.svg")
                    : Svgs(
                        image: "assets/icons/checkbox_unchecked.svg",
                        color: grey),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Inter(
                  text: task.text,
                  weight: FontWeight.w500,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
        Divider(color: lightGrey),
      ],
    );
  }
}
