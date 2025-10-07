import 'package:flutter/material.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({super.key});

  @override
  State<AppNavigation> createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('nav')));
  }
}
