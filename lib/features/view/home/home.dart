import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:tickit/core/utils/app_colors.dart';
import 'package:tickit/core/widgets/text.dart';
import 'package:tickit/features/view_model/floating_button.dart';
import 'package:tickit/features/view_model/providers/connectivity_provider.dart';
import 'package:tickit/features/view_model/providers/task_provider.dart';
import 'package:tickit/features/view_model/providers/settings_provider.dart';

import 'package:tickit/features/view/home/appbar.dart';
import 'package:tickit/features/view/home/card_list.dart';
import 'package:tickit/features/view/no_connection.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final String now = DateFormat("dd EEE").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    final taskProv = Provider.of<TaskProvider>(context, listen: false);
    final settingProv = Provider.of<SettingsProvider>(context);
    final user = Supabase.instance.client.auth.currentUser;

    return SafeArea(
      child: Scaffold(
        appBar: homeAppBar(context, now, settingProv.selectedAvatar),
        body: Consumer<ConnectivityProvider>(
          builder: (_, connectivityProvider, __) {
            SchedulerBinding.instance.addPostFrameCallback((_) async {
              if (!connectivityProvider.isOffline &&
                  !settingProv.isFetch &&
                  user != null) {
                taskProv.fetchTask();
                settingProv.fetchAvatar();
              }
            });
            return connectivityProvider.isOffline
                ? NoConnection()
                : Consumer<TaskProvider>(
                    builder: (_, taskProvider, __) {
                      final card = taskProvider.allTasks;
                      if (taskProvider.isLoading) {
                        return Center(
                          child: CircularProgressIndicator(color: black),
                        );
                      } else if (card.isEmpty) {
                        return Center(
                          child: Inter(
                            text: "Kickstart your productivity...",
                            size: 12,
                            weight: FontWeight.normal,
                          ),
                        );
                      } else {
                        return CardList(card: card);
                      }
                    },
                  );
          },
        ),
        floatingActionButton: floatingButton(context),
      ),
    );
  }
}
