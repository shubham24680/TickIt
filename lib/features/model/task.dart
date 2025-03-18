class Task {
  final int id;
  String task;
  String? tag;
  bool isCompleted;
  int priorityLevel;

  Task({
    required this.id,
    required this.task,
    this.tag,
    this.isCompleted = false,
    this.priorityLevel = 5,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json["id"],
      task: json["task"],
      tag: json["tag"],
      isCompleted: json["is_completed"],
      priorityLevel: json["priority_level"],
    );
  }
}
