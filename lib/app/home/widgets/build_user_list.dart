import 'package:flutter/material.dart';
import 'package:telegramm_app/app/chat/chat_services.dart';
import 'package:telegramm_app/app/home/widgets/build_user_list_item.dart';
// import 'package:telegramm_app/services/auth/auth_services.dart';

class BuildUserList extends StatelessWidget {
  const BuildUserList({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatServices chatServices = ChatServices();
    // final AuthServices authServices = AuthServices();

    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: chatServices.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No users found'));
        }

        final users = snapshot.data!;

        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          itemCount: users.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final userData = users[index];
            return UserListItem(userData: userData);
          },
        );
      },
    );
  }
}
