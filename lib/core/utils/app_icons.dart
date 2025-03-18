import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tickit/core/utils/app_colors.dart';

class Svgs extends StatelessWidget {
  const Svgs({super.key, required this.image, this.color, this.size});

  final String image;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      height: size ?? 25,
      colorFilter: ColorFilter.mode(color ?? black, BlendMode.srcIn),
    );
  }
}
