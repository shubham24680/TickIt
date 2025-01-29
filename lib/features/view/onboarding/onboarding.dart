import 'package:flutter/material.dart';

import 'package:glare/features/view/onboarding/logo.dart';
import 'package:glare/features/view/onboarding/bottom_container.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: Image.asset(
              "assets/images/onboarding_bg.jpg",
              fit: BoxFit.cover,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 1100) {
                final double height = size.height * 0.35;
                final double width = size.width;
                final double fontSize = 20;
                final double buttonSize = 100;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    logo,
                    BottomContainer(
                      height: height,
                      width: width,
                      fontSize: fontSize,
                      buttonSize: buttonSize,
                    ),
                  ],
                );
              } else {
                final double height = size.height;
                final double width = size.width * 0.35;
                final double fontSize = 36;
                final double buttonSize = 300;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    logo,
                    BottomContainer(
                      height: height,
                      width: width,
                      fontSize: fontSize,
                      buttonSize: buttonSize,
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
