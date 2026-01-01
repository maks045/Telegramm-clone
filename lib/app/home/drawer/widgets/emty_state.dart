// empty_state.dart
import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class EmptyPosts extends StatelessWidget {
  const EmptyPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('No post yet...', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          Text(
            'Publish photos and videos to display on\nyour profile page',
            style: TextStyle(color: AppColors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class EmptyStories extends StatelessWidget {
  const EmptyStories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('No stories yet...', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          Text(
            'Upload a new story to view it here.',
            style: TextStyle(color: AppColors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
