import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:telegramm_app/app/chat/chat_services.dart';
import 'package:telegramm_app/app/chat/presentation/widgets/chut_buble.dart';
import 'package:telegramm_app/core/loading/app_loading.dart';
import 'package:telegramm_app/services/auth/auth_services.dart';

class MessageList extends StatelessWidget {
  final String receiverID;
  const MessageList({super.key, required this.receiverID});

  @override
  Widget build(BuildContext context) {
    final ChatServices chatServices = ChatServices();
    final AuthServices authServices = AuthServices();
    final user = authServices.currentUser;

    if (user == null) {
      return const Center(
        child: Text('Please sign in to view messages'),
      );
    }

    final String senderID = user.uid;

    return StreamBuilder<QuerySnapshot>(
      stream: chatServices.getMessages(senderID, receiverID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('Error loading messages'));
        }
        if (snapshot.connectionState == ConnectionState.waiting ||
            !snapshot.hasData) {
          return const Center(child: AppLoading());
        }

        final docs = snapshot.data!.docs;

        return ListView.builder(
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final doc = docs[docs.length - 1 - index];

            return _buildMessageItem(doc, authServices);
          },
        );
      },
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc, AuthServices authServices) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    print(
        "SenderID: ${data['senderID']} | CurrentUserID: ${authServices.currentUser!.uid}");
    bool isCurrentUser = data['senderID'] == authServices.currentUser!.uid;

    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: ChutBuble(
          message: data['message'],
          isCurrentUser: isCurrentUser,
        ),
      ),
    );
  }
}
