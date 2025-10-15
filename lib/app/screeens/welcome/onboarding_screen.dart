import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
    required this.image,
    required this.description,
    required this.title,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(child: Image.asset(image)),
        SizedBox(height: 20),
        Text(title),
        SizedBox(height: 20),

        Text(description, textAlign: TextAlign.center),
      ],
    );
  }
}
