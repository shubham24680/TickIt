import 'package:flutter/material.dart';

import 'package:tickit/features/view/onboarding/logo.dart';
import 'package:tickit/features/view/onboarding/bottom_container.dart';

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
              final double height = constraints.maxHeight;
              final double width = constraints.maxWidth;

              if (constraints.maxWidth < 600) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    logo,
                    BottomContainer(
                      height: height * 0.4,
                      width: width,
                      fontSize: height * 0.03,
                      buttonSize: height * 0.17,
                    ),
                  ],
                );
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    logo,
                    BottomContainer(
                      height: height,
                      width: width * 0.4,
                      fontSize: width * 0.03,
                      buttonSize: width * 0.17,
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
