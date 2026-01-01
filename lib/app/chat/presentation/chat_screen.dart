import 'package:flutter/material.dart';
import 'package:telegramm_app/app/chat/chat_services.dart';
import 'package:telegramm_app/app/chat/presentation/widgets/message_list.dart';
import 'package:telegramm_app/app/chat/presentation/widgets/user_input.dart';
import 'package:telegramm_app/services/auth/auth_services.dart';

class ChatScreen extends StatefulWidget {
  final String recieverEmail;
  final String receiverID;
  const ChatScreen({
    super.key,
    required this.recieverEmail,
    required this.receiverID,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ChatServices _chatServices = ChatServices();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final user = AuthServices().currentUser;
    if (user == null) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please sign in to send messages')),
      );
      return;
    }

    try {
      await _chatServices.sendMessage(widget.receiverID, text);
      if (!mounted) return;
      _messageController.clear();
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to send message: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recieverEmail),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/chat-img.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: MessageList(
                  receiverID: widget.receiverID,
                ),
              ),
              ChatUserInput(
                controller: _messageController,
                onSendPressed: _sendMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
