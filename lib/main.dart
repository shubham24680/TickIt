import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tickit/core/constants/api_constants.dart';

import 'package:tickit/core/utils/app_colors.dart';
import 'package:tickit/routes/routes.dart';
import 'package:tickit/theme/light_theme.dart';
import 'package:tickit/features/view_model/providers/connectivity_provider.dart';
import 'package:tickit/features/view_model/providers/settings_provider.dart';
import 'package:tickit/features/view_model/providers/task_provider.dart';

import 'package:tickit/features/view_model/authentication.dart';
import 'package:tickit/features/view/profile/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: ApiConstants.URL,
    anonKey: ApiConstants.ANON_KEY,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: black,
      systemNavigationBarColor: black,
    ));

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
        ChangeNotifierProvider(create: (context) => TaskProvider()),
        ChangeNotifierProvider(create: (context) => SettingsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: routes,
        theme: light,
        // darkTheme: dark,
        home: Authentication(),
        // home: Profile(),
      ),
    );
  }
}
