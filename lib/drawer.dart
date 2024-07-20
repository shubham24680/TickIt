import 'package:flutter/material.dart';

import 'theme.dart';
import 'component.dart';

class CDrawer extends StatelessWidget {
  const CDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: white,
        child: const Column(
          children: [
            CThemeButton(text: "myTodo", route: 'myTodo'),
            CThemeButton(text: "myWishes", route: 'myWishes'),
          ],
        ),
      ),
    );
  }
}

class CThemeButton extends StatelessWidget {
  const CThemeButton({super.key, required this.text, required this.route});

  final String text;
  final String route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamedAndRemoveUntil(context, route, (route) => false),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Expanded(
          child: CHeading(text: text, color: black),
        ),
      ),
    );
  }
}
