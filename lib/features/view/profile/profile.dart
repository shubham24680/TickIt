import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tickit/core/widgets/text.dart';
import 'package:tickit/services/google_auth.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
            ),
          ),
          title: Inter(
            text: "Profile",
            size: 20,
            weight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Inter(
                text: Supabase.instance.client.auth.currentUser?.email ??
                    "NO EMAIL",
              ),
              ElevatedButton(
                onPressed: () => GoogleService.signOut(context),
                child: Inter(text: "Log Out"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
