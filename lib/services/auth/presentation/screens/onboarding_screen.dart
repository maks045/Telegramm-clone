import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
    required this.image,
    required this.description,
    required this.title,
    // required this.currentPage,
    // required this.totalPage,
  });

  final String image;
  final String title;
  final String description;
  // final int currentPage;
  // final int totalPage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(backgroundImage: AssetImage(image), radius: 80),
        SizedBox(height: 20),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(color: AppColors.text),
        ),
        SizedBox(height: 20),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.grey),
        ),
        const SizedBox(height: 30),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: List.generate(totalPage, (index) {
        //     bool isActive = index == currentPage;
        //     return AnimatedContainer(
        //       duration: const Duration(milliseconds: 300),
        //       margin: const EdgeInsets.symmetric(horizontal: 4),
        //       width: isActive ? 16 : 8,
        //       height: 6,
        //       decoration: BoxDecoration(
        //         color: isActive ? Colors.blueAccent : Colors.grey,
        //         borderRadius: BorderRadius.circular(8),
        //       ),
        //     );
        //   }),
        // ),
      ],
    );
  }
}
