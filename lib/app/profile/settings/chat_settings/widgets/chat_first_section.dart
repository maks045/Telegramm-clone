import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/settings/chat_settings/widgets/custom_listile.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class FirstSection extends StatefulWidget {
  const FirstSection({super.key});

  @override
  State<FirstSection> createState() => _FirstSectionState();
}

class _FirstSectionState extends State<FirstSection> {
  @override
  Widget build(BuildContext context) {
    double sliderVal = 50.0;
    return Container(
      decoration: BoxDecoration(color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Message text size',
            style: TextTheme.of(context)
                .titleMedium!
                .copyWith(color: AppColors.primary),
          ),
          Slider(
              value: sliderVal,
              divisions: 5,
              max: 100.0,
              label: '${sliderVal.round()}',
              onChanged: (double value) {
                setState(() {
                  sliderVal = value;
                });
              }),
          CustomListile(
            icon: Icons.wallpaper_outlined,
            title: 'Change Chat Wallpaper',
          ),
          CustomListile(
            icon: Icons.color_lens_outlined,
            title: 'Change Name Color',
          ),
          CustomListile(
            icon: Icons.nights_stay_outlined,
            title: 'Switch to Night Mode',
          ),
          CustomListile(
            icon: Icons.nights_stay_outlined,
            title: 'Browse Themes',
          ),
          Text(
            'Message corners',
            style: TextTheme.of(context)
                .titleMedium!
                .copyWith(color: AppColors.primary),
          ),
          Slider(
              value: sliderVal,
              divisions: 5,
              max: 100.0,
              label: '${sliderVal.round()}',
              onChanged: (double value) {
                setState(() {
                  sliderVal = value;
                });
              }),
        ],
      ),
    );
  }
}
