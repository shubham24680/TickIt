import 'package:flutter/material.dart';
import 'package:glare/features/view/home/card_list.dart';
import 'package:provider/provider.dart';

import 'package:glare/core/widgets/text.dart';
import 'package:glare/features/view_model/home_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (_, value, __) {
        final card = value.allTasks;
        return card.isEmpty
            ? Center(
                child: Inter(
                  text: "Kickstart your productivity...",
                  size: 12,
                  weight: FontWeight.normal,
                ),
              )
            : CardList(card: card);
      },
    );
  }
}
