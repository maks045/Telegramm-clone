import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class CustomListile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? subtitle;
  final Widget? trailing;
  const CustomListile(
      {super.key,
      required this.icon,
      required this.title,
      this.subtitle,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: AppColors.primary,
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColors.primary),
      ),
      subtitle: subtitle,
      trailing: trailing,
    );
  }
}
