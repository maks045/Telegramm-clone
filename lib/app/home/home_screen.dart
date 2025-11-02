import 'package:flutter/material.dart';
import 'package:telegramm_app/app/chat/chat_services.dart';
import 'package:telegramm_app/app/home/widgets/home_drawer.dart';
import 'package:telegramm_app/app/home/screens/chat_screen.dart';
import 'package:telegramm_app/app/home/widgets/user_tile.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';
import 'package:telegramm_app/services/auth/auth_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ChatServices chatServices = ChatServices();
  final AuthServices authServices = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Telegram'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: HomeDrawer(),
      body: _buildUserList(),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 80.0, // Set your desired width
            height: 80.0, // Set your desired height
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    // Handle button press
                  },
                  shape: CircleBorder(), // Ensures a perfect circle
                  child: Icon(Icons.edit),
                ),
              ],
            ),
          ),
          Container(
            width: 80.0, // Set your desired width
            height: 80.0, // Set your desired height
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    // Handle button press
                  },
                  shape: CircleBorder(
                    side: BorderSide(color: Colors.blue, width: 2.0),
                  ), // Ensures a perfect circle
                  child: Icon(Icons.photo_camera_rounded, color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: null,
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: chatServices.getUserStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // No users in collection
          return const Center(child: Text('No users found'));
        }

        final users = snapshot.data!;

        // Debug: print first user to console (remove in production)
        // ignore: avoid_print
        print('Loaded ${users.length} users, first: ${users.first}');

        return ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          itemCount: users.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final user = users[index];
            return _buildUserListItem(user, context);
          },
        );
      },
    );
    //StreamBuilder<List<Map<String, dynamic>>>(
    //   stream: chatServices.getUserStream(),
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     } else if (snapshot.hasError) {
    //       return Center(child: Text('Error: ${snapshot.error}'));
    //     }

    //     final users = snapshot.data ?? [];
    //     if (users.isEmpty) {
    //       return const Center(child: Text('No users found'));
    //     }

    //     return ListView(
    //       children: users.map((userData) {
    //         return UserTile(
    //           text: userData['email'],
    //           onTap: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                 builder: (_) =>
    //                     ChatScreen(recieverEmail: userData['email']),
    //               ),
    //             );
    //           },
    //         );
    //       }).toList(),
    //     );
    //   },
    // );
  }

  Widget _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    final email =
        userData['email']?.toString() ??
        userData['emailAddress']?.toString() ??
        'Unknown';
    final display = email;

    return UserTile(
      text: display,
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
