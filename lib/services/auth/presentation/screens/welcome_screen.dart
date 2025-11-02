import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegramm_app/core/theme/theme_provider.dart';
import 'package:telegramm_app/services/auth/presentation/screens/login_page.dart';
import 'package:telegramm_app/services/auth/presentation/screens/onboarding_pages.dart';

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
      appBar: AppBar(
        title: IconButton(
          icon: Icon(Icons.sunny),
          color: Colors.black,
          onPressed: () =>
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Spacer(),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(onBoardingPages.length, (index) {
              bool isActive = _currentPage == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                width: isActive ? 16 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: isActive ? Colors.blueAccent : Colors.grey,
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            }),
          ),
          SizedBox(height: 250),

          // Spacer(),
          // ElevatedButton(
          //   onPressed: () {
          //     Navigator.pushReplacementNamed(context, '/phoneVerification');
          //   },
          //   child: Text('Start messaging'),
          // ),
          // Padding(
          //   padding: EdgeInsetsGeometry.symmetric(horizontal: 120),
          //   child: Container(
          //     width: 200,
          //     height: 20,
          //     decoration: BoxDecoration(
          //       color: Colors.red,
          //       borderRadius: BorderRadius.circular(12),
          //     ),
          //     child: Text('Start messaging'),
          //   ),
          // ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (ctx) => LoginPage()),
            ),
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                'Start messaging',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}
