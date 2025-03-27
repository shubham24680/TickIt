import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:tickit/core/utils/app_colors.dart';
import 'package:tickit/core/utils/app_icons.dart';
import 'package:tickit/core/widgets/text.dart';
import 'package:tickit/features/model/task.dart';
import 'package:tickit/features/view_model/providers/task_provider.dart';

class TaskCard extends StatefulWidget {
  const TaskCard(
      {super.key, required this.currentTask, required this.currentIndex});

  final Task currentTask;
  final int currentIndex;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    final TaskProvider prov = Provider.of(context, listen: false);

    // End side buttons
    customSlidableAction(
        String image, Color backgroundColor, Function(BuildContext) onpressed) {
      return CustomSlidableAction(
        onPressed: onpressed,
        autoClose: true,
        backgroundColor: backgroundColor,
        child: Svgs(image: image, color: white, size: 20),
      );
    }

    return Slidable(
      endActionPane: ActionPane(
        motion: StretchMotion(),
        children: [
          customSlidableAction(
            "assets/icons/edit.svg",
            black,
            (context) {
              prov.taskController.text = widget.currentTask.task;
              prov.selectedIndex = widget.currentIndex;
              Navigator.pushNamed(context, "/edit");
            },
          ),
          customSlidableAction(
            "assets/icons/delete.svg",
            red,
            (context) => prov.removeTask(context, widget.currentIndex),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Checkbox
            GestureDetector(
              onTap: () => prov.changeCheckBox(widget.currentIndex),
              child: widget.currentTask.isCompleted
                  ? Svgs(image: "assets/icons/checked.svg")
                  : Svgs(
                      image: "assets/icons/unchecked.svg",
                      color: lightGrey,
                    ),
            ),
            SizedBox(width: 10),

            // Task
            Flexible(
              child: Inter(
                text: widget.currentTask.task,
                decoration: widget.currentTask.isCompleted
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
