import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/settings/chat_settings/widgets/chat_setting_appbar.dart';
import 'package:telegramm_app/app/profile/settings/chat_settings/widgets/chat_first_section.dart';

class ChatSettingsScreen extends StatefulWidget {
  const ChatSettingsScreen({super.key});

  @override
  State<ChatSettingsScreen> createState() => _ChatSettingsScreenState();
}

class _ChatSettingsScreenState extends State<ChatSettingsScreen> {
  bool onValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatSettingAppbar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FirstSection(),
                ListTile(
                  leading: Icon(Icons.nightlight_round_outlined),
                  title: Text(
                    'Autho-Night Mode',
                  ),
                  subtitle: Text('Off'),
                  trailing: Switch(
                      value: onValue,
                      onChanged: (value) {
                        setState(() {
                          onValue = value;
                        });
                      }),
                ),
                ListTile(
                  leading: Icon(Icons.wordpress_outlined),
                  title: Text(
                    'In-App Browser',
                  ),
                  subtitle: Text('Open external links within the app'),
                  trailing: Switch(
                      value: onValue,
                      onChanged: (value) {
                        setState(() {
                          onValue = value;
                        });
                      }),
                ),
                ListTile(
                  leading: Icon(Icons.play_circle_outline_outlined),
                  title: Text(
                    'Animations',
                  ),
                  subtitle: Text('Reduce motion effects to save power'),
                ),
                ListTile(
                  leading: Icon(Icons.emoji_emotions_outlined),
                  title: Text(
                    'Stickers and Emoji',
                  ),
                  subtitle: Text('Manage stickers,emoji and reactions'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
