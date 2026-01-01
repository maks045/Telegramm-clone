import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
    required this.description,
    required this.title,
    required this.animation,
  });

  final String animation;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200, // adjust size
          child: Lottie.asset(
            animation,
            repeat: true, // loops automatically
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppColors.text),
        ),
        const SizedBox(height: 20),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.grey),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
