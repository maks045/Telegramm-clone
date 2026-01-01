import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:telegramm_app/app/chat/models/message.dart';

class ChatServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUserStream() {
    return firestore.collection('Users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  Future<void> sendMessage(String receiverID, String message) async {
    final currentUser = auth.currentUser;
    if (currentUser == null) throw Exception('Not authenticated');

    final String currentUserID = currentUser.uid;
    final String currentUserEmail = currentUser.email ?? '';
    final Timestamp timestamp = Timestamp.now();

    final MessageModel newMessage = MessageModel(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    // chat room id deterministic for two participants
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    await firestore
        .collection('chat_room')
        .doc(chatRoomID)
        .collection('messages')
        .add(newMessage.toMap());
    // await firestore
    // .collection('Users') // ✅ correct collection
    // .doc(user.uid)
    // .set({
    //   'name': name,
    //   'email': email,
    //   // other info
    // });

    // Optional: update lastMessage on chat room doc for fast chat list loads
    await firestore.collection('chat_room').doc(chatRoomID).set({
      // 'lastMessage': message,
      // 'lastMessageTime': timestamp,
      // 'participants': ids,
    }, SetOptions(merge: true));
  }

  // Stream messages between userID and otherUserID (both UIDs)
  Stream<QuerySnapshot> getMessages(String userID, String otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return firestore
        .collection('chat_room')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy('timestamp', descending: false) // oldest -> newest
        .snapshots();
  }
}
