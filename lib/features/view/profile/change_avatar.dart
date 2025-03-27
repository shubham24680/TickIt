import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tickit/core/utils/app_colors.dart';
import 'package:tickit/core/widgets/text.dart';
import 'package:tickit/features/view_model/providers/settings_provider.dart';

class ChangeAvatar extends StatelessWidget {
  const ChangeAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final prov = Provider.of<SettingsProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          backgroundColor: lightGrey,
          title: Inter(text: "Select your Avatar"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            // Profile Pic
            Container(
              height: 120,
              width: 120,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: black,
                shape: BoxShape.circle,
                border: Border.all(color: white, width: 5),
              ),
              child: Consumer<SettingsProvider>(
                builder: (_, provider, __) {
                  return SvgPicture.asset(
                    provider.changedAvatar,
                    fit: BoxFit.contain,
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height - 316,
              child: GridView.builder(
                itemCount: 10,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => prov.changeYourAvatar(index),
                  child: SvgPicture.asset(
                    prov.avatar[index],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              prov.selectYourAvatar();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: black,
                foregroundColor: white,
                minimumSize: Size.fromHeight(60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
            child: Inter(text: "Select", color: white),
          ),
        ),
      ),
    );
  }
}
