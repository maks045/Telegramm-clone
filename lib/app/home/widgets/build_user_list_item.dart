import 'package:flutter/material.dart';
import 'package:telegramm_app/app/chat/presentation/chat_screen.dart';
import 'package:telegramm_app/app/home/widgets/user_tile.dart';

class UserListItem extends StatelessWidget {
  final Map<String, dynamic> userData;

  const UserListItem({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    final email = userData['email']?.toString() ??
        userData['emailAddress']?.toString() ??
        'Unknown';
    return UserTile(
      text: email,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => ChatScreen(
              recieverEmail: email,
              receiverID: userData['uid']?.toString() ?? '',
            ),
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:telegramm_app/app/chat/presentation/chat_screen.dart';
// import 'package:telegramm_app/app/home/widgets/user_tile.dart';

// class UserListItem extends StatelessWidget {
//   final Map<String, dynamic> userData;

//   const UserListItem({super.key, required this.userData});

//   @override
//   Widget build(BuildContext context) {
//     final email =
//         (userData['email'] ?? userData['emailAddress'] ?? 'Unknown') as String;
//     final uid = (userData['uid'] ?? '') as String;

//     // Safety check before navigating
//     return UserTile(
//       text: email,
//       onTap: () {
//         if (uid.isEmpty) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 content: Text("This user doesn't have a valid UID.")),
//           );
//           return;
//         }

//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (ctx) => ChatScreen(
//               receiverEmail: email,
//               receiverID: uid,
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
