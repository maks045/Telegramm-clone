import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/settings/chat_settings/widgets/custom_listile.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class NotificationChatContainer extends StatefulWidget {
  const NotificationChatContainer({super.key});

  @override
  State<NotificationChatContainer> createState() =>
      _NotificationChatContainerState();
}

class _NotificationChatContainerState extends State<NotificationChatContainer> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Notifications for chats'),
            CustomListile(
              icon: Icons.person_pin_outlined,
              title: 'Private chats',
              subtitle: Text('Tap to change'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            CustomListile(
              icon: Icons.group_outlined,
              title: 'Groups',
              subtitle: Text('on, 5 exceptions'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            CustomListile(
              icon: Icons.mic,
              title: 'Channels',
              subtitle: Text('Tap to change'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            CustomListile(
              icon: Icons.play_circle_outline_rounded,
              title: 'Stries',
              subtitle: Text('Off, 1 automatic exception'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            CustomListile(
              icon: Icons.favorite_border_outlined,
              title: 'Reactions',
              subtitle: Text('Messages, Stories'),
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
    );
  }
}
