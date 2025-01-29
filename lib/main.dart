import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:glare/routes/routes.dart';
import 'package:glare/theme/light_theme.dart';
// import 'package:glare/theme/dark_theme.dart';
import 'package:glare/features/view_model/home_provider.dart';

import 'package:glare/features/view_model/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: "https://uwhivekbpjxbigwvgqdi.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV3aGl2ZWticGp4Ymlnd3ZncWRpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzc3MTk3NjUsImV4cCI6MjA1MzI5NTc2NX0.vXSeXBuxwA06KxIJtwZBiJuSZWIgGDFR2AFFrD18JTg",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider()),
      ],
      child: MaterialApp(
        routes: routes,
        theme: light,
        // darkTheme: dark,
        debugShowCheckedModeBanner: false,
        home: Authentication(),
      ),
    );
  }
}
