import 'package:flutter/material.dart';

import 'package:tickit/features/view/onboarding/onboarding.dart';
import 'package:tickit/features/view/home/home.dart';
import 'package:tickit/features/view/edit/edit.dart';
import 'package:tickit/features/view/profile/profile.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/onboarding': (_) => Onboarding(),
  '/home': (_) => Home(),
  '/edit': (_) => const Edit(),
  '/profile': (_) => const Profile(),
};
