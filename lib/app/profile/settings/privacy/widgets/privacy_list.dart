import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class PrivacyList extends StatelessWidget {
  const PrivacyList({super.key});

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
            Text('Privacy'),
            ListTile(
              title: Text('Phone Number'),
              trailing: trailingText('My Contacts'),
            ),
            ListTile(
              title: Text('Last Seen & Online'),
              trailing: trailingText('Everybody'),
            ),
            ListTile(
              title: Text('Profile Photos'),
              trailing: trailingText('Everybody'),
            ),
            ListTile(
              title: Text('Forwarded Messages'),
              trailing: trailingText('Everybody'),
            ),
            ListTile(
              title: Text('Calls'),
              trailing: trailingText('Everybody'),
            ),
            ListTile(
              title: Text('Voice Messages'),
              trailing: trailingText('Everybody'),
            ),
            ListTile(
              title: Text('Messages'),
              trailing: trailingText('Everybody'),
            ),
            ListTile(
              title: Text('Birthday'),
              trailing: trailingText('My Contacts'),
            ),
            ListTile(
              title: Text('Gifts'),
              trailing: trailingText('Mini Apps'),
            ),
            ListTile(
              title: Text('Bio'),
              trailing: trailingText('Everybody'),
            ),
            ListTile(
              title: Text('Invites'),
              trailing: trailingText('Everybody'),
            ),
          ],
        ),
      ),
    );
  }
}
