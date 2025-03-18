import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tickit/core/utils/app_colors.dart';
import 'package:tickit/core/utils/app_icons.dart';
import 'package:tickit/core/widgets/text.dart';
import 'package:tickit/features/view_model/home_provider.dart';
import 'package:tickit/features/view_model/text_field.dart';

class Edit extends StatelessWidget {
  const Edit({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Close button
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Svgs(image: "assets/icons/close.svg"),
              ),
              SizedBox(height: 20),

              // Text Field
              Expanded(
                child: Editor(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(10),
          child: Consumer<HomeProvider>(
            builder: (_, value, __) {
              return ElevatedButton(
                onPressed: value.isButtonEnabled
                    ? () {
                        if (value.selectedIndex != -1) {
                          value.updateTask();
                        } else {
                          value.addTask();
                        }
                        Navigator.pop(context);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: black,
                    foregroundColor: white,
                    minimumSize: Size.fromHeight(60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                child: Inter(text: "Save", color: white),
              );
            },
          ),
        ),
      ),
    );
  }
}
