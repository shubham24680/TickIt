import 'package:flutter/material.dart';
import 'package:tickit/core/utils/app_colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(color: black),
      ),
    );
  }
}
