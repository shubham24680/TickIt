import 'package:flutter/material.dart';
import 'package:glare/core/utils/app_colors.dart';
import 'package:glare/core/utils/app_icons.dart';
import 'package:glare/features/view/onboarding/text_button.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.buttonSize,
  });

  final double height;
  final double width;
  final double fontSize;
  final double buttonSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Let's get started! Join now and take control of your tasks.",
            textAlign: TextAlign.center,
            style: GoogleFonts.caveat(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, "/home"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF58DD7).withOpacity(0.3),
                foregroundColor: Color(0xFFF58DD7),
                shadowColor: Colors.transparent,
                minimumSize: Size(buttonSize, buttonSize),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
            child: Svgs(
              image: "assets/icons/google.svg",
              color: Color(0xFFF58DD7),
              size: 35,
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.quicksand(
                fontSize: 12,
                color: black,
                fontWeight: FontWeight.w600,
              ),
              children: [
                const TextSpan(
                    text: "By creating an account you agree to TickIt \n"),
                textButton("Terms of Services", "https://hinge.co/terms"),
                const TextSpan(text: " and "),
                textButton("Privacy Policy.", "https://hinge.co/cookie-policy"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
