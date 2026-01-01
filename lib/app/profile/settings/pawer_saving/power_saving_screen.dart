import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/settings/pawer_saving/widgets/pawer_save_options.dart';
import 'package:telegramm_app/app/profile/settings/pawer_saving/widgets/power_save_mode.dart';
import 'package:telegramm_app/core/appbar/app_appbar.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class PowerSavingScreen extends StatefulWidget {
  const PowerSavingScreen({super.key});

  @override
  State<PowerSavingScreen> createState() => _PowerSavingScreenState();
}

class _PowerSavingScreenState extends State<PowerSavingScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppAppbar(title: 'Power Saving'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PowerSaveMode(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                  'Automatically reduse power usage and animatiosn when battery is below 10%.'),
            ),
            PawerSaveOptions(),
            SizedBox(
              height: 12,
            ),
            Container(
              color: AppColors.white,
              child: ListTile(
                title: Text('Enable Smooth Transitions'),
                trailing: Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'You can disable animated transitions between different sections of the app'),
            )
          ],
        ),
      ),
    );
  }
}
