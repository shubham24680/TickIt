import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:glare/core/utils/app_colors.dart';

class Svgs extends StatelessWidget {
  const Svgs({super.key, required this.image, this.color});

  final String image;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: 30,
      colorFilter: ColorFilter.mode(color ?? black, BlendMode.srcIn),
    );
  }
}
