import 'package:flutter/material.dart';
import 'package:glare/features/model/task.dart';
import 'package:glare/features/view_model/task_card.dart';

class CardList extends StatelessWidget {
  const CardList({super.key, required this.card});

  final List<Task> card;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: card.length,
      padding: const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 70),
      itemBuilder: (context, index) {
        return TaskCard(task: card[index]);
      },
    );
  }
}
