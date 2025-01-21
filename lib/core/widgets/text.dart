import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:glare/core/utils/app_colors.dart';

class Inter extends StatelessWidget {
  const Inter({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
  });

  final String text;
  final Color? color;
  final double? size;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        color: color ?? black,
        fontSize: size ?? 14,
        fontWeight: weight ?? FontWeight.w500,
      ),
    );
  }
}
