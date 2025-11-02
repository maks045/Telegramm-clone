import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/app_navigation.dart';
import 'package:telegramm_app/app/home/home_screen.dart';
import 'package:telegramm_app/app/profile/profile_screen.dart';
import 'package:telegramm_app/app/profile/screens/edit_info_screen.dart';
import 'package:telegramm_app/services/auth/auth_services.dart';
import 'package:telegramm_app/core/loading/app_loading.dart';
import 'package:telegramm_app/services/auth/presentation/screens/welcome_screen.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, this.pageIfNotConnected});

  final Widget? pageIfNotConnected;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authService,
      builder: (context, authServices, child) {
        return StreamBuilder(
          stream: authServices.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = const WelcomeScreen();
            } else if (snapshot.hasData) {
              widget = const HomeScreen();
            } else {
              widget = pageIfNotConnected ?? const WelcomeScreen();
            }
            return widget;
          },
        );
      },
    );
  }
}
