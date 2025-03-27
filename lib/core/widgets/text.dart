import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tickit/core/utils/app_colors.dart';

class Inter extends StatelessWidget {
  const Inter({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
    this.decoration,
    this.textAlign,
  });

  final String text;
  final TextAlign? textAlign;
  final Color? color;
  final double? size;
  final FontWeight? weight;
  final TextDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      style: GoogleFonts.inter(
        color: color ?? black,
        fontSize: size ?? 16,
        fontWeight: weight ?? FontWeight.w500,
        decoration: decoration ?? TextDecoration.none,
      ),
    );
  }
}
