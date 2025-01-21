import 'package:flutter/material.dart';
import 'package:glare/features/view/home/appbar.dart';
import 'package:glare/features/view/home/home.dart';
import 'package:glare/features/view_model/floating_button.dart';
import 'package:intl/intl.dart';

class Desktop extends StatelessWidget {
  Desktop({super.key});

  final String now = DateFormat('dd MMM').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(now),
      body: Home(),
      floatingActionButton: floatingButton(context),
    );
  }
}
