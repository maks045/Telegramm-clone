import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/settings/chat_settings/widgets/custom_listile.dart';
import 'package:telegramm_app/app/profile/settings/notification/screens/in_app_container.dart';
import 'package:telegramm_app/app/profile/settings/notification/widgets/notification_chat_container.dart';
import 'package:telegramm_app/core/appbar/app_appbar.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppAppbar(title: 'Notifications and Sounds'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              NotificationChatContainer(),
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
                        'Calls',
                        style: TextStyle(color: AppColors.primary),
                      ),
                      ListTile(
                        title: Text('Vibrate'),
                        trailing: Text('Default'),
                      ),
                      ListTile(
                        title: Text('Ringtone'),
                        trailing: Text('Default'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              InAppContainer(),
            ],
          ),
        ));
  }
}
