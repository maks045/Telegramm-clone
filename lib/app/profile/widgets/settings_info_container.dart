import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/widgets/custom_list_tile.dart';
import 'package:telegramm_app/app/profile/settings/data_storage/data_storage_screen.dart';
import 'package:telegramm_app/app/profile/settings/chat_folder/chat_folders_screen.dart';
import 'package:telegramm_app/app/profile/settings/chat_settings/screens/chat_settings_screen.dart';
import 'package:telegramm_app/app/profile/settings/devices/devices_screen.dart';
import 'package:telegramm_app/app/profile/settings/language/language_screen.dart';
import 'package:telegramm_app/app/profile/settings/notification/notifications_screen.dart';
import 'package:telegramm_app/app/profile/settings/pawer_saving/power_saving_screen.dart';
import 'package:telegramm_app/app/profile/settings/privacy/screens/privacy_screen.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class SettingsInfoContainer extends StatelessWidget {
  const SettingsInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings',
                style: TextTheme.of(context)
                    .titleMedium!
                    .copyWith(color: AppColors.primary),
              ),
              CustomListTile(
                  icon: Icons.chat_bubble_outline,
                  title: 'Chat Settings',
                  page: ChatSettingsScreen()),
              CustomListTile(
                  icon: Icons.lock_outline,
                  title: 'Privacy and Security',
                  page: PrivacyScreen()),
              CustomListTile(
                  icon: Icons.notifications_none,
                  title: 'Notifications and Sounds',
                  page: NotificationsScreen()),
              CustomListTile(
                  icon: Icons.pie_chart_outline_sharp,
                  title: 'Data and Storage',
                  page: DataStorageScreen()),
              CustomListTile(
                  icon: Icons.battery_0_bar,
                  title: 'Power Saving',
                  page: PowerSavingScreen()),
              CustomListTile(
                  icon: Icons.folder_open,
                  title: 'Chat Folders',
                  page: ChatFoldersScreen()),
              CustomListTile(
                  icon: Icons.computer,
                  title: 'Devices',
                  page: DevicesScreen()),
              CustomListTile(
                  icon: Icons.language,
                  title: 'Language',
                  page: LanguageScreen()),
            ],
          ),
        ));
  }
}
