import 'package:flutter/material.dart';
import 'package:glare/features/view/home/appbar.dart';
import 'package:glare/features/view_model/floating_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:glare/core/utils/app_colors.dart';
import 'package:glare/features/view/home/card_list.dart';
import 'package:glare/core/widgets/text.dart';
import 'package:glare/features/view_model/home_provider.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final String now = DateFormat("dd EEE").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).fetchTask();
    });

    return SafeArea(
      child: Scaffold(
        appBar: homeAppBar(context, now),
        body: Consumer<HomeProvider>(
          builder: (_, value, __) {
            final card = value.allTasks;
            return value.isLoading
                ? Center(
                    child: CircularProgressIndicator(color: black),
                  )
                : card.isEmpty
                    ? Center(
                        child: Inter(
                          text: "Kickstart your productivity...",
                          size: 12,
                          weight: FontWeight.normal,
                        ),
                      )
                    : CardList(card: card);
          },
        ),
        floatingActionButton: floatingButton(context),
      ),
    );
  }
}
