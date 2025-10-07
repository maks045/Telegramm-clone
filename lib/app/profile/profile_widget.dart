import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telegramm_app/auth/auth_services.dart';
import 'package:telegramm_app/app/app_data.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
        // Print the error message to help debugging in debug builds.
        // In production you may want to show a user-facing message instead.
        // Use safe access in case message is null.
        // ignore: avoid_print
        print(e.message ?? e.code);
      }
    }

    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: logout,
          icon: const Icon(Icons.logout),
          tooltip: 'Logout',
        ),
      ),
    );
  }
}
