import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleService {
  static final _supabase = Supabase.instance.client;

  /// Web Client ID that you registered with Google Cloud.
  static final String _webClientId =
      '92589055617-su8r89blunflid5671rl5f4edp7u57j5.apps.googleusercontent.com';

  // iOS Client ID that you registered with Google Cloud.
  static final String _iosClientId =
      '92589055617-rce6tvpjfd857sauvrtcf681gh8stvkn.apps.googleusercontent.com';

  // Google sign in on Android will work without providing the Android
  // Client ID registered on Google Cloud.
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: _iosClientId,
    serverClientId: _webClientId,
  );

  static Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final googleUser = await _googleSignIn.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;

      if (accessToken == null) {
        throw 'No Access Token found.';
      }
      if (idToken == null) {
        throw 'No ID Token found.';
      }

      final auth = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      final Session? session = auth.session;
      if (context.mounted && session != null) {
        log("Sign in successful");
        Navigator.pushNamedAndRemoveUntil(context, "/home", (_) => false);
      }
    } catch (e) {
      log("Error -> $e");
    }
  }

  static Future<void> signOut(BuildContext context) async {
    log("Sign out successfully");
    await _supabase.auth.signOut();
    await _googleSignIn.signOut();
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, "/onboarding", (_) => false);
    }
  }
}
