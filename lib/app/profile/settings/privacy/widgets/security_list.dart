import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class SecurityList extends StatelessWidget {
  const SecurityList({super.key});

  @override
  Widget build(BuildContext context) {
    Text trailingText(String text) {
      return Text(
        text,
        style: TextStyle(color: AppColors.primary),
      );
    }

    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Security',
              style: TextTheme.of(context)
                  .titleMedium!
                  .copyWith(color: AppColors.primary),
            ),
            ListTile(
                leading: Icon(Icons.key_rounded),
                title: Text('Two-Step Verification'),
                trailing: trailingText('Off')),
            ListTile(
                leading: Icon(Icons.av_timer_outlined),
                title: Text('Auto-Delete Messages'),
                trailing: trailingText('Off')),
            ListTile(
                leading: Icon(Icons.lock_clock_outlined),
                title: Text('Passcode Lock'),
                trailing: trailingText('Off')),
            ListTile(
                leading: Icon(Icons.email_outlined),
                title: Text('Login Email'),
                trailing: trailingText('a@gmail.com')),
            ListTile(
                leading: Icon(Icons.key_rounded),
                title: Text('Blocked Users'),
                trailing: trailingText('None')),
            ListTile(
                leading: Icon(Icons.computer_outlined),
                title: Text('Devices'),
                trailing: trailingText('2')),
          ],
        ),
      ),
    );
  }
}
