import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tickit/core/utils/app_colors.dart';
import 'package:tickit/core/widgets/text.dart';
import 'package:tickit/features/view_model/providers/connectivity_provider.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/No_connection.png", height: 200),
            SizedBox(height: 20),
            Inter(
              text: "No Internet Connection",
              size: 12,
              weight: FontWeight.normal,
            ),
            // ElevatedButton(
            //   onPressed: () => connProv.checkConnectivity(),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: black,
            //     foregroundColor: white,
            //     fixedSize: Size(110, 40),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12),
            //     ),
            //   ),
            //   child: Inter(
            //     text: "Try Again",
            //     color: white,
            //     size: 12,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
