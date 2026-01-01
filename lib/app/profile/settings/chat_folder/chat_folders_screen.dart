import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:telegramm_app/core/appbar/app_appbar.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class ChatFoldersScreen extends StatefulWidget {
  const ChatFoldersScreen({super.key});

  @override
  State<ChatFoldersScreen> createState() => _ChatFoldersScreenState();
}

class _ChatFoldersScreenState extends State<ChatFoldersScreen> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppAppbar(title: 'Chat Folders'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 12,
          ),
          Center(
            child: SizedBox(
              width: 300,
              child: Column(
                children: [
                  Lottie.asset('assets/emoji/folder.json'),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Create folders for different groups of chats and quickly switch between them',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.grey),
                  )
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
                    'Chat Folders',
                    style: TextTheme.of(context)
                        .titleMedium!
                        .copyWith(color: AppColors.primary),
                  ),
                  ListTile(
                    leading: Icon(Icons.menu),
                    title: Text('All Chats'),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.add_circle_outline_outlined,
                      color: AppColors.primary,
                    ),
                    title: Text('Create New Folder'),
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
            child: Column(
              children: [
                ListTile(
                  title: Text('Show Folder Tags'),
                  trailing: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RichText(
              text: TextSpan(
                  text: 'Subscribe to ',
                  style: TextStyle(color: AppColors.grey),
                  children: [
                    TextSpan(
                        text: 'Telegram Premium',
                        style: TextStyle(color: AppColors.primary)),
                    TextSpan(
                        text:
                            ' to display folder names for each chat in the chat list')
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
