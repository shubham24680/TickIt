import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:glare/core/utils/app_colors.dart';

Padding get logo => Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Text(
        "TickIt",
        style: GoogleFonts.dancingScript(
          fontSize: 28,
          color: white,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
