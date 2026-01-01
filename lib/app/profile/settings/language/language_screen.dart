import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/settings/language/widgets/translate_container.dart';
import 'package:telegramm_app/core/appbar/app_appbar.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English';

  final languages = [
    {"name": "English", "subtitle": "English"},
    {"name": "العربية", "subtitle": "Arabic"},
    {"name": "Беларуская", "subtitle": "Belarusian"},
    {"name": "Català", "subtitle": "Catalan"},
    {"name": "Hrvatski", "subtitle": "Croatian"},
    {"name": "Čeština", "subtitle": "Czech"},
    {"name": "Nederlands", "subtitle": "Dutch"},
    {"name": "Suomi", "subtitle": "Finnish"},
    {"name": "Français", "subtitle": "French"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppAppbar(title: 'Language'),
      body: Column(
        children: [
          TranslateContainer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  "The 'Translate' button will apear when you make a single tap on a text message",
                  style: TextStyle(color: AppColors.grey),
                ),
                SizedBox(
                  height: 14,
                ),
                Text(
                  'Google may havve access to the text of messages you translate',
                  style: TextStyle(color: AppColors.grey),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.white,
              child: ListView.separated(
                itemCount: languages.length,
                separatorBuilder: (_, __) => const Divider(
                  height: 1,
                  color: Colors.grey,
                ),
                itemBuilder: (context, index) {
                  final lang = languages[index];

                  return RadioListTile<String>(
                    value: lang["name"]!,
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                    title: Text(lang["name"]!),
                    subtitle: Text(
                      lang["subtitle"]!,
                      style: TextStyle(color: AppColors.grey),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
