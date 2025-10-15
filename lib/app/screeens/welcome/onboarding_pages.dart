import 'package:flutter/material.dart';
import 'package:telegramm_app/app/screeens/welcome/onboarding_screen.dart';

List<Widget> onBoardingPages = [
  OnboardingScreen(
    image: 'assets/logo/logo_t.png',
    description: "The world's fastest meassaging app it is free and secure",
    title: 'Telegram',
  ),
  OnboardingScreen(
    image: 'assets/logo/speed.png',
    description:
        "Telegram delivers messages faster than any other application.",
    title: 'Fast',
  ),
  OnboardingScreen(
    image: 'assets/logo/free.jpg',
    description:
        "Telegram provides free unlimited cloud storage for chats and media.",
    title: 'Free',
  ),
  OnboardingScreen(
    image: 'assets/logo/infinty.png',
    description: "Telegram has no limits on the size of your media and chats.",
    title: 'Powerful',
  ),
  OnboardingScreen(
    image: 'assets/logo/secure.jpg',
    description: "Telegram keeps your message safe from hacker attacks.",
    title: 'Secure',
  ),
];
