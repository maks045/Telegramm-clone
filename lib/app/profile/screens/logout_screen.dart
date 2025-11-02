import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telegramm_app/app/app_data.dart';
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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              child: Text('Log out'),
              onTap: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  actions: <Widget>[
                    Text('dddfdsfdsff'),
                    Row(
                      children: [
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
