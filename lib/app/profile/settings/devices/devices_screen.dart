import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/settings/devices/widgets/link_desktop_container.dart';
import 'package:telegramm_app/app/profile/settings/devices/widgets/this_device_container.dart';
import 'package:telegramm_app/core/appbar/app_appbar.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppAppbar(title: 'Devices'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            LinkDesktopContainer(),
            SizedBox(
              height: 12,
            ),
            ThisDeviceContainer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Logs out all the devices except for this one'),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Active sessions',
                      style: TextTheme.of(context)
                          .titleMedium!
                          .copyWith(color: AppColors.primary),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/icon/chrome.png',
                        ),
                      ),
                      title: Text('Chrome 141'),
                      subtitle:
                          Text('Telegram Web 2.2 K\nBishkek,Kyrgyzstan Oct 28'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                  'The official Telegram app is available for Android, iPhone, iPad, Windows, macOS and Linux.'),
            ),
            Container(
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Automatically terminate old sessions',
                      style: TextTheme.of(context)
                          .titleMedium!
                          .copyWith(color: AppColors.primary),
                    ),
                    ListTile(
                      title: Text('If inactive for'),
                      trailing: Text('6 months'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
