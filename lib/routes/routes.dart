import 'package:flutter/material.dart';

import 'package:tickit/features/view/onboarding/onboarding.dart';
import 'package:tickit/core/utils/terms.dart';
import 'package:tickit/core/utils/privacy_policy.dart';
import 'package:tickit/features/view/home/home.dart';
import 'package:tickit/features/view/edit/edit.dart';
import 'package:tickit/features/view/profile/profile.dart';
import 'package:tickit/features/view/profile/change_avatar.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/onboarding': (_) => Onboarding(),
  '/termsOfServices': (_) => Terms(),
  '/privacyPolicy': (_) => PrivacyPolicy(),
  '/home': (_) => Home(),
  '/edit': (_) => const Edit(),
  '/profile': (_) => Profile(),
  '/changeAvatar': (_) => ChangeAvatar(),
};
