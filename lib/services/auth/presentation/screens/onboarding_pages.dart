import 'package:flutter/material.dart';
import 'package:telegramm_app/services/auth/presentation/screens/onboarding_screen.dart';

List<Widget> onBoardingPages = [
  OnboardingScreen(
    // image: 'assets/logo/logo_t.png',
    animation: 'assets/emoji/telegram_logo.json',
    description: "The world's fastest meassaging app. \n It is free and secure",
    title: 'Telegram',
  ),
  OnboardingScreen(
    animation: 'assets/emoji/speed.json',
    description:
        "Telegram delivers messages\n faster than any other application.",
    title: 'Fast',
  ),
  OnboardingScreen(
    animation: 'assets/emoji/free.json',
    description:
        "Telegram provides free unlimited\n cloud storage for chats and media.",
    title: 'Free',
  ),
  OnboardingScreen(
    animation: 'assets/emoji/infinity.json',
    description:
        "Telegram has no limits on\n the size of your media and chats.",
    title: 'Powerful',
  ),
  OnboardingScreen(
    animation: 'assets/emoji/secure.json',
    description: "Telegram keeps your message safe\n from hacker attacks.",
    title: 'Secure',
  ),
];
