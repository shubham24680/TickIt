import 'package:flutter/material.dart';

import 'package:glare/core/utils/app_colors.dart';
import 'package:glare/core/widgets/text.dart';

AppBar homeAppBar(String now) {
  return AppBar(
    title: Padding(
      padding: const EdgeInsets.only(left: 10, top: 20),
      child: Row(
        children: [
          Inter(text: "Glare", size: 36, weight: FontWeight.bold),
          SizedBox(width: 10),
          Inter(text: now, size: 36, color: grey),
        ],
      ),
    ),
  );
}
