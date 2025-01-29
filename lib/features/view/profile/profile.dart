import 'package:flutter/material.dart';
import 'package:glare/core/widgets/text.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Inter(text: "Profile", size: 36),
      ),
    );
  }
}
