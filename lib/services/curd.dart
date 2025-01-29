import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:glare/features/model/task.dart';

class SupabaseDB {
  final _supabase = Supabase.instance.client.from('notes');

  create(String newTask) async {
    log("created");
    return await _supabase.insert({
      'task': newTask,
      'isCompleted': false,
    }).select();
  }

  update(Task tempTask) async {
    await _supabase.update({
      'task': tempTask.task,
      'isCompleted': tempTask.isCompleted,
    }).eq("id", tempTask.id);
    log("updated");
  }

  read() async {
    log("read");
    return await _supabase.select('*').order("id", ascending: false);
  }

  delete(Task tempTask) async {
    await _supabase.delete().eq("id", tempTask.id);
    log("deleted");
  }
}
