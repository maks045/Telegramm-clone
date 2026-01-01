import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/widgets/custom_list_tile.dart';
import 'package:telegramm_app/app/profile/settings/my_star/my_stars_screen.dart';
import 'package:telegramm_app/app/profile/settings/business/telegram_business_screen.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class ThirdSectionContainer extends StatelessWidget {
  const ThirdSectionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomListTile(
                icon: Icons.star_border_outlined,
                title: 'My Stars',
                page: MyStarsScreen()),
            CustomListTile(
                icon: Icons.store_outlined,
                title: ' Telegram Business',
                page: TelegramBusinessScreen()),
          ],
        ),
      ),
    );
  }
}
