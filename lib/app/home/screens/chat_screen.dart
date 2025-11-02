import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:telegramm_app/app/chat/chat_services.dart';
import 'package:telegramm_app/app/home/widgets/my_text_field.dart';
import 'package:telegramm_app/services/auth/auth_services.dart';

class ChatScreen extends StatelessWidget {
  final String recieverEmail;
  final String receiverID;
  ChatScreen({
    super.key,
    required this.recieverEmail,
    required this.receiverID,
  });

  final TextEditingController _messageController = TextEditingController();

  final ChatServices _chatServices = ChatServices();
  final AuthServices _authServices = AuthServices();

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatServices.sendMessage(receiverID, _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recieverEmail)),
      body: Column(
        children: [
          Expanded(child: _buildMessageList()),
          Padding(padding: const EdgeInsets.all(8.0), child: _buildUserInput()),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authServices.currentUser!.uid;

    return StreamBuilder<QuerySnapshot>(
      stream: _chatServices.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading messages'));
        }
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final docs = snapshot.data!.docs;

        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final doc = docs[index];
            return _buildMessageItem(doc);
          },
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderID'] == _authServices.currentUser!.uid;
    var alignment = isCurrentUser
        ? Alignment.centerRight
        : Alignment.centerLeft;
    return Container(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: isCurrentUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [Text(data['message'])],
      ),
    );
  }

  Widget _buildUserInput() {
    return Row(
      children: [
        Expanded(
          child: MyTextField(
            controller: _messageController,
            hintText: 'Type a message',
            obscureText: false,
            onSubmitted: (_) => sendMessage(),
          ),
        ),
        IconButton(onPressed: sendMessage, icon: Icon(Icons.arrow_upward)),
      ],
    );
  }
}
