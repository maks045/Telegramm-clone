import 'package:flutter/material.dart';
import 'package:telegramm_app/core/navs/navigation_helper.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget page;
  const CustomListTile(
      {super.key, required this.icon, required this.title, required this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () => navigateTo(context, page),
    );
  }
}
