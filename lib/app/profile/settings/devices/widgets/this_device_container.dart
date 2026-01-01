import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class ThisDeviceContainer extends StatelessWidget {
  const ThisDeviceContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This device',
              style: TextTheme.of(context)
                  .titleMedium!
                  .copyWith(color: AppColors.primary),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/icon/android_logo.webp',
                ),
              ),
              title: Text('Redmi Redmi 13C'),
              subtitle:
                  Text('Telegram Android 12.1.1\nBishkek,Kyrgyzstan online'),
            ),
            ListTile(
              leading: Icon(
                Icons.back_hand_outlined,
                color: Colors.red,
              ),
              title: Text(
                'Terminate All Other Sessions',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
