import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telegramm_app/services/auth/auth_services.dart';
import 'package:telegramm_app/app/app_data.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void popPage() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: popPage,
        ),
      ),
      // body: Center(
      //   child: IconButton(
      //     // onPressed: logout,
      //     icon: const Icon(Icons.logout),
      //     tooltip: 'Logout',
      //   ),
      // ),
    );
  }
}
