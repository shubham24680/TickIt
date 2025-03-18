import 'package:flutter/material.dart';

import 'package:tickit/features/model/task.dart';
import 'package:tickit/features/view_model/task_card.dart';

class CardList extends StatelessWidget {
  const CardList({super.key, required this.card});

  final List<Task> card;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: card.length,
      padding: const EdgeInsets.only(top: 20, bottom: 70),
      itemBuilder: (context, index) {
        return TaskCard(currentTask: card[index], currentIndex: index);
      },
    );
  }
}
