import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class AlternativeList extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final String title;
  final String subtitle;
  const AlternativeList(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: AppColors.grey,
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: AppColors.grey),
      ),
    );
  }
}
