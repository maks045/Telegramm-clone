import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegramm_app/app/profile/profile_widget.dart';
import 'package:telegramm_app/core/theme/theme_provider.dart';
import 'package:telegramm_app/services/auth/presentation/screens/welcome_screen.dart';
import 'package:telegramm_app/services/auth/auth_layout.dart';
import 'package:telegramm_app/services/auth/change_password_screen.dart';
import 'package:telegramm_app/services/auth/delete_account_screen.dart';
import 'package:telegramm_app/services/auth/presentation/screens/login_page.dart';
import 'package:telegramm_app/services/auth/presentation/screens/register_screen.dart';
import 'package:telegramm_app/services/auth/reset_password_screen.dart';
import 'package:telegramm_app/services/auth/update_username_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Telegramm',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const AuthLayout(pageIfNotConnected: WelcomeScreen()),
      routes: {
        '/login': (_) => const LoginPage(),
        '/register': (_) => const RegisterScreen(),
        '/reset-password': (_) => const ResetPasswordScreen(),
        '/change-password': (_) => const ChangePasswordScreen(),
        '/update-username': (_) => const UpdateUsernameScreen(),
        '/delete-account': (_) => const DeleteAccountScreen(),
        '/profile': (_) => const ProfileWidget(),
      },
    );
  }
}
