import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tickit/features/model/task.dart';

class SupabaseDB {
  final _supabase = Supabase.instance.client.from('Tasks');

  create(String newTask, String? newTag) async {
    log("created");
    return await _supabase.insert({
      'task': newTask,
      'tag': newTag,
    }).select();
  }

  update(Task tempTask) async {
    await _supabase.update({
      'task': tempTask.task,
      'tag': tempTask.tag,
      'is_completed': tempTask.isCompleted,
      'priority_level': tempTask.priorityLevel,
    }).eq("id", tempTask.id);
    log("updated");
  }

  read() async {
    log("read");
    return await _supabase.select('*').order("id", ascending: false);
  }

  delete(Task tempTask) async {
    log("deleted");
    await _supabase.delete().eq("id", tempTask.id);
  }
}
