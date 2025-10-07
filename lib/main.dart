import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:telegramm_app/auth/auth_layout.dart';
import 'package:telegramm_app/auth/presentation/login_page.dart';
import 'package:telegramm_app/auth/presentation/register_screen.dart';
import 'package:telegramm_app/auth/reset_password_screen.dart';
import 'package:telegramm_app/auth/change_password_screen.dart';
import 'package:telegramm_app/auth/update_username_screen.dart';
import 'package:telegramm_app/auth/delete_account_screen.dart';
import 'package:telegramm_app/app/profile/profile_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telegramm App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthLayout(pageIfNotConnected: LoginPage()),
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
