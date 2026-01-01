import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class SavedMessagesScreen extends StatefulWidget {
  const SavedMessagesScreen({super.key});

  @override
  State<SavedMessagesScreen> createState() => _SavedMessagesScreenState();
}

class _SavedMessagesScreenState extends State<SavedMessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.bookmark_outline,
                size: 24,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            const Text('Saved Messages'),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/chat-img.jpg"),
            fit: BoxFit.cover, // Makes it fill the whole screen
          ),
        ),
        child: Column(
          children: [
            Expanded(
                child: Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Lottie.asset('assets/emoji/cool_emoji.json',
                        width: 100, height: 100),
                    Text(
                      'Your cloud storage',
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Forward messages here to save them'),
                        Text('Send media and files to store them'),
                        Text('Access this chat from any devices'),
                        Text('Use search to quickly find things'),
                      ],
                    ),
                  ],
                ),
              ),
            )),
            Container(
              color: AppColors.white,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.emoji_emotions_outlined)),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Message'),
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.attach_file)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
