import 'package:flutter/material.dart';

import 'package:glare/core/utils/app_colors.dart';
import 'package:glare/core/utils/app_icons.dart';

Widget floatingButton(BuildContext context) {
  return FloatingActionButton(
    onPressed: () => Navigator.pushNamed(context, '/edit'),
    backgroundColor: black,
    child: Svgs(image: "assets/icons/add.svg", color: white),
  );
}
