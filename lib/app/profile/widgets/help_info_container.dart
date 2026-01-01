import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/help/telegram_faq.dart';
import 'package:telegramm_app/app/profile/help/telegram_privacy.dart';
import 'package:telegramm_app/app/profile/widgets/ask_question_diolog.dart';
import 'package:telegramm_app/core/extensions/router_extension.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class HelpInfoContainer extends StatelessWidget {
  const HelpInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help',
                style: TextTheme.of(context)
                    .titleMedium!
                    .copyWith(color: AppColors.primary),
              ),
              ListTile(
                onTap: () {
                  showDialog(
                      context: context, builder: (ctx) => AskQuestionDiolog());
                },
                leading: Icon(Icons.chat_outlined),
                title: Text('Ask a Question'),
              ),
              ListTile(
                onTap: () => context.push(WebsiteScreen()),
                leading: Icon(Icons.question_mark_rounded),
                title: Text('Telegram FAQ'),
              ),
              ListTile(
                onTap: () => context.push(TelegramPrivacyPolicy()),
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text('Privacy Policy'),
              ),
            ],
          ),
        ));
  }
}
