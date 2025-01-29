import 'package:flutter/material.dart';

import 'package:glare/core/utils/app_colors.dart';
import 'package:glare/core/widgets/text.dart';

AppBar homeAppBar(BuildContext context, String now) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Padding(
      padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              Inter(text: "Tasks", size: 28, weight: FontWeight.bold),
              SizedBox(width: 10),
              Inter(text: now, size: 28, color: grey),
            ],
          ),
          // GestureDetector(
          //   onTap: () => Navigator.pushNamed(context, "/profile"),
          //   child: CircleAvatar(
          //     radius: 15,
          //     backgroundImage: AssetImage("assets/images/onboarding_bg.jpg"),
          //   ),
          // ),
        ],
      ),
    ),
  );
}
