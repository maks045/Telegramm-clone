import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/settings/privacy/widgets/privacy_list.dart';
import 'package:telegramm_app/app/profile/settings/privacy/widgets/security_list.dart';
import 'package:telegramm_app/core/appbar/app_appbar.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppAppbar(title: 'Privacy and Security'),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SecurityList(),
              SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Review the list of devices where you are logged in to your Telegram account.'),
              ),
              SizedBox(
                height: 8,
              ),
              PrivacyList(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'You can restrict which users are allowed to add you to group and channels'),
              ),
              Container(
                color: AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Delete my account',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                    ListTile(
                      title: Text('If away for'),
                      trailing: Text(
                        '18 months',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'If you do not come online at least once within this period, your account will be deleted along with all messages and contacts'),
              ),
              Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bots and websites',
                        style: TextStyle(color: AppColors.primary),
                      ),
                      ListTile(
                        title: Text('Clear Payment and Shopping Info'),
                      ),
                    ],
                  ),
                ),
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
                        'Contacts',
                        style: TextStyle(color: AppColors.primary),
                      ),
                      ListTile(
                        title: Text('Delete Synced Contacts'),
                      ),
                      ListTile(
                        title: Text('Sync Contacts'),
                        trailing: Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
