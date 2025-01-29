import 'package:flutter/material.dart';

import 'package:glare/features/view/home/home.dart';
import 'package:glare/features/view/edit/edit.dart';
import 'package:glare/features/view/profile/profile.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/home': (_) => Home(),
  '/edit': (_) => const Edit(),
  '/profile': (_) => const Profile(),
};
