import 'package:flutter/material.dart';
import 'package:telegramm_app/app/screeens/welcome/onboarding_pages.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: onBoardingPages,
            ),
          ),
          // Add indicators for onboarding pages
          // Add navigation buttons (e.g., "Next", "Skip", "Get Started")
          if (_currentPage == onBoardingPages.length - 1)
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/phoneVerification');
              },
              child: Text('Start messaging'),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Skip onboarding
                    Navigator.pushReplacementNamed(
                      context,
                      '/phoneVerification',
                    );
                  },
                  child: Text('Skip'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Text('Next'),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
