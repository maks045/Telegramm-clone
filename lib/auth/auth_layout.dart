import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/app_navigation.dart';
import 'package:telegramm_app/app/home/welcome_screen.dart';
import 'package:telegramm_app/auth/auth_services.dart';
import 'package:telegramm_app/core/loading/app_loading.dart';

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
              widget = const AppLoadingPage();
            } else if (snapshot.hasData) {
              widget = const AppNavigation();
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
