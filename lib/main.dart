import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:glare/routes/routes.dart';
import 'package:glare/theme/light_theme.dart';
import 'package:glare/features/view_model/home_provider.dart';

import 'package:glare/layouts/layout.dart';
import 'package:glare/layouts/mobile/mobile.dart';
import 'package:glare/layouts/tablet/tablet.dart';
import 'package:glare/layouts/desktop/desktop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: MaterialApp(
        routes: routes,
        theme: light,
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: ResponsiveLayout(
            mobileLayout: Mobile(),
            tabletLayout: Tablet(),
            desktopLayout: Desktop(),
          ),
        ),
      ),
    );
  }
}
