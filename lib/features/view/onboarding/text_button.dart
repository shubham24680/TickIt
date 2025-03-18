import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tickit/core/utils/app_colors.dart';
import 'package:tickit/core/utils/url.dart';

TextSpan textButton(String text, String url) {
  return TextSpan(
    text: text,
    recognizer: TapGestureRecognizer()..onTap = () => launchURL(url),
    style: GoogleFonts.quicksand(
      fontSize: 12,
      color: pink,
      fontWeight: FontWeight.w900,
    ),
  );
}
