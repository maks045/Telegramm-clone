import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/widgets/account_info_container.dart';
import 'package:telegramm_app/app/profile/widgets/help_info_container.dart';
import 'package:telegramm_app/app/profile/widgets/settings_info_container.dart';
import 'package:telegramm_app/app/profile/widgets/third_section_container.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class CustomSliverToboxAdapter extends StatefulWidget {
  const CustomSliverToboxAdapter({super.key});

  @override
  State<CustomSliverToboxAdapter> createState() =>
      _CustomSliverToboxAdapterState();
}

class _CustomSliverToboxAdapterState extends State<CustomSliverToboxAdapter> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.grey[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountInfoContainer(),
            SizedBox(
              height: 12,
            ),
            SettingsInfoContainer(),
            SizedBox(
              height: 12,
            ),
            ThirdSectionContainer(),
            SizedBox(
              height: 12,
            ),
            HelpInfoContainer(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Telegram for Android v12.1.1 (5334) store bundled arm64-v8a',
                textAlign: TextAlign.center,
                style: TextTheme.of(context)
                    .titleSmall!
                    .copyWith(color: AppColors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
