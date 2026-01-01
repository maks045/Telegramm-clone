import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/widgets/my_text_field.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class ChatUserInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSendPressed;
  final VoidCallback? onAttachPressed;
  final VoidCallback? onEmojiPressed;

  const ChatUserInput(
      {super.key,
      required this.controller,
      required this.onSendPressed,
      this.onAttachPressed,
      this.onEmojiPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: onEmojiPressed,
            icon: const Icon(Icons.emoji_emotions_outlined),
          ),
          Expanded(
            child: MyTextField(
              controller: controller,
              hintText: 'Message',
              obscureText: false,
              onSubmitted: (_) => onSendPressed(),
            ),
          ),
          IconButton(
            onPressed: onAttachPressed,
            icon: const Icon(Icons.attach_file_outlined),
          ),
          IconButton(
            onPressed: onSendPressed,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
