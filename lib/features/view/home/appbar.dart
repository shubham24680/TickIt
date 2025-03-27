import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tickit/core/utils/app_colors.dart';
import 'package:tickit/core/widgets/text.dart';

AppBar homeAppBar(BuildContext context, String now, String avatar) {
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
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/profile"),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: black,
              child: SvgPicture.asset(avatar, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    ),
  );
}
