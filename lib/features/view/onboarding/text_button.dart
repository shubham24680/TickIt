import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:glare/core/utils/url.dart';
import 'package:google_fonts/google_fonts.dart';

TextSpan textButton(String text, String url) {
  return TextSpan(
    text: text,
    recognizer: TapGestureRecognizer()..onTap = () => launchURL(url),
    style: GoogleFonts.quicksand(
      fontSize: 12,
      color: Color(0xFFF58DD7),
      fontWeight: FontWeight.w900,
    ),
  );
}
