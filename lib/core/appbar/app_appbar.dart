import 'package:flutter/material.dart';

class AppAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;

  const AppAppbar({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          if (subtitle != null)
            Text(
              subtitle!,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
        ],
      ),
      // backgroundColor: Colors.white,
      elevation: 2,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
