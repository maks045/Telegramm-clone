import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:telegramm_app/app/chat/models/message.dart';

class ChatServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  // // ✅ Add this method
  // Stream<List<Map<String, dynamic>>> getUserStream() {
  //   return firestore.collection('Users').snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) => doc.data()).toList();
  //   });
  // }

  // // You can add other chat-related methods here later,
  // // like sending messages, getting chat streams, etc.
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return FirebaseFirestore.instance.collection('Users').snapshots().map((
      snapshot,
    ) {
      return snapshot.docs.map((doc) {
        final data = Map<String, dynamic>.from(doc.data() as Map);
        // Include the document id to help with navigation or debugging
        data['id'] = doc.id;
        return data;
      }).toList();
    });
  }

  ///send message

  Future<void> sendMessage(String recieverID, message) async {
    ///get current user info
    final String currentUserID = auth.currentUser!.uid;
    final String currentUserEmail = auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    ///create a new message

    MessageModel newMessage = MessageModel(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      message: message,
      receiverID: recieverID,
      timestamp: timestamp,
    );

    //construct chat room ID for 2 people

    List<String> ids = [currentUserID, recieverID];
    ids.sort();
    String chatRoomID = ids.join('_');
    await firestore
        .collection('chat_room')
        .doc(chatRoomID)
        .collection('messages')
        .add(newMessage.toMap());
  }

  ///get message

  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');
    return firestore
        .collection('chat_room')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
