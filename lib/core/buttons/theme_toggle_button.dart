import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telegramm_app/core/theme/theme_provider.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.isDarkMode;

    return IconButton(
      onPressed: themeProvider.toggleTheme,
      icon: Icon(
        isDarkMode ? Icons.dark_mode : Icons.light_mode,
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      tooltip: isDarkMode ? 'Switch to light mode' : 'Switch to dark mode',
    );
  }
}
