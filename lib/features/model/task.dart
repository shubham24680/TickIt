class Task {
  final int id;
  String task;
  bool isCompleted;

  Task({
    required this.id,
    required this.task,
    this.isCompleted = false,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["id"] as int,
      task: json["task"] as String,
      isCompleted: json["isCompleted"] as bool,
    );
  }
}
