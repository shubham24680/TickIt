import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tickit/core/utils/app_colors.dart';
// import 'package:tickit/core/utils/url.dart';

TextSpan textButton(BuildContext context, String text, String route) {
  return TextSpan(
    text: text,
    // recognizer: TapGestureRecognizer()..onTap = () => launchURL(url),
    recognizer: TapGestureRecognizer()
      ..onTap = () => Navigator.pushNamed(context, route),
    style: GoogleFonts.quicksand(
      fontSize: 12,
      color: pink,
      fontWeight: FontWeight.w900,
    ),
  );
}
