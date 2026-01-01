import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

const profileTabs = [
  Tab(text: 'Posts'),
  Tab(text: 'Archived'),
];

final profileTabPages = [
  const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No post yet...', style: TextStyle(fontSize: 18)),
        Text(
          'Publish photos and videos to display on your profile page',
          style: TextStyle(color: AppColors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
  const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('No stories yet...', style: TextStyle(fontSize: 18)),
        Text(
          'Upload a new story to view it here.',
          style: TextStyle(color: AppColors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
];
