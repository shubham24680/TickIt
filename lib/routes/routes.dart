import 'package:flutter/material.dart';
import 'package:glare/features/view/edit/edit.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/edit': (_) => const Edit(),
};
