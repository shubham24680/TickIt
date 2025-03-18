import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:tickit/core/utils/app_colors.dart';

import 'package:tickit/features/view/home/home.dart';
import 'package:tickit/features/view/onboarding/onboarding.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Supabase.instance.client.auth.onAuthStateChange,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: black);
        } else if (snapshot.hasError) {
          return Text("Stream Error -> ${snapshot.hasError}");
        } else if (snapshot.hasData && snapshot.data!.session != null) {
          return Home();
        } else {
          return Onboarding();
        }
      },
    );
  }
}
