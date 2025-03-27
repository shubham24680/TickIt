import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:tickit/core/utils/app_colors.dart';
import 'package:tickit/core/widgets/text.dart';
import 'package:tickit/features/view_model/providers/settings_provider.dart';
import 'package:tickit/features/view_model/providers/task_provider.dart';
import 'package:tickit/services/google_auth.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  final User? _user = Supabase.instance.client.auth.currentUser;

  @override
  Widget build(BuildContext context) {
    final taskProv = Provider.of<TaskProvider>(context, listen: false);
    final settingProv = Provider.of<SettingsProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 350,
                width: double.infinity,
                color: lightGrey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Pic
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: black,
                        shape: BoxShape.circle,
                        border: Border.all(color: white, width: 5),
                      ),
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, "/changeAvatar"),
                        child: Consumer<SettingsProvider>(
                          builder: (_, provider, __) =>
                              SvgPicture.asset(provider.selectedAvatar),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    // Name
                    Inter(
                      text: _user?.userMetadata?["full_name"] ?? "...",
                      textAlign: TextAlign.center,
                      weight: FontWeight.bold,
                      size: 20,
                    ),
                    // Email Address
                    Inter(
                      text: _user?.email ?? "...",
                      size: 12,
                    ),
                  ],
                ),
              ),

              // Logout button
              ElevatedButton(
                onPressed: () async {
                  await GoogleService.signOut(context);
                  taskProv.clearTask();
                  settingProv.clearSetting();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  foregroundColor: black,
                ),
                child: Inter(
                  text: "Log Out",
                  color: Colors.red,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
      ),
    );
  }
}
