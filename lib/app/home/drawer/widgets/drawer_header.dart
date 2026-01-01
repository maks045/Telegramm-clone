import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/profile_screen.dart';
import 'package:telegramm_app/core/buttons/theme_toggle_button.dart';
import 'package:telegramm_app/core/navs/navigation_helper.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(color: Colors.lightBlueAccent),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => navigateTo(
              context,
              const ProfileScreen(),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),
                const ThemeToggleButton(),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Text('Name'),
          const Text('034-567-8901'),
        ],
      ),
    );
  }
}
