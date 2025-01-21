import 'package:flutter/material.dart';
import 'package:glare/features/model/task.dart';

class HomeProvider extends ChangeNotifier {
  TextEditingController taskController = TextEditingController();
  List<Task> allTasks = [];

  void changeCheckBox(Task task, bool isCompleted) {
    task.isCompleted = isCompleted;
    notifyListeners();
  }

  void createTask(String newTask) {
    allTasks.add(Task(text: newTask));
    notifyListeners();
  }

  void updateTask() {}
}
