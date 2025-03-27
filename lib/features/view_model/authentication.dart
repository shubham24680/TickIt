import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:tickit/features/view/home/home.dart';
import 'package:tickit/features/view/loading.dart';
import 'package:tickit/features/view/no_connection.dart';
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
          log("Waiting");
          return Loading();
        } else if (snapshot.hasError) {
          log("NoConnection");
          return NoConnection();
        } else if (snapshot.hasData && snapshot.data!.session != null) {
          log("Home");
          return Home();
        } else {
          log("Onboarding");
          return Onboarding();
        }
      },
    );
  }
}
