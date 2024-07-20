import 'package:flutter/material.dart';

import 'my_todo.dart';
import 'my_wishes.dart';

Map<String, WidgetBuilder> routes = {
  'myTodo': (context) => const Todo(),
  'myWishes': (context) => const Wishes(),
};
