import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telegramm_app/app/app_data.dart';
import 'package:telegramm_app/app/profile/screens/logout/alternative_option_container.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';
import 'package:telegramm_app/services/auth/auth_services.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  void popPage() {
    Navigator.pop(context);
  }

  void logout() async {
    try {
      await authService.value.signOut();
      AppData.navBarCurrentIndexNotifier.value = 0;
      AppData.onBoardingCurrentIndexNotifier.value = 0;
      popPage();
    } on FirebaseAuthException catch (e) {
      print(e.message ?? e.code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      body: Column(
        children: [
          AlternativeOptionContainer(),
          SizedBox(
            height: 12,
          ),
          Container(
            width: double.infinity,
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Text(
                  'Log out',
                  style: TextTheme.of(context)
                      .titleMedium!
                      .copyWith(color: Colors.red),
                ),
                onTap: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                      title: Text('Log Out'),
                      content: SizedBox(
                        height: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Are you sure you want to log out?'),
                            Text('This will cancel all your Secret Chats.'),
                            Text(
                                'You can use Telegram on all your devices at once and use several accounts in the same app.'),
                            Row(
                              children: [
                                Spacer(),
                                TextButton(
                                  onPressed: () => popPage(),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => logout(),
                                  child: Text('Log out'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Logging out deactivates all Secret Chats.',
              style: TextStyle(color: AppColors.grey),
            ),
          )
        ],
      ),
    );
  }
}
