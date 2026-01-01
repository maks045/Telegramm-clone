import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/screens/logout/alternative_list.dart';
import 'package:telegramm_app/app/profile/widgets/ask_question_diolog.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class AlternativeOptionContainer extends StatelessWidget {
  const AlternativeOptionContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Alternative options',
              style: TextTheme.of(context)
                  .titleMedium!
                  .copyWith(color: AppColors.primary),
            ),
            AlternativeList(
                icon: Icons.person_add_alt,
                title: 'Add another account',
                subtitle:
                    'Connect other Telegram accounts and easily switch between them.'),
            AlternativeList(
                icon: Icons.key_rounded,
                title: 'Set a Oasscode',
                subtitle:
                    'Lock the app with a passcode so that others cant open it.'),
            AlternativeList(
              title: 'Clear Cache',
              subtitle:
                  'Free up disk space on your device; your media will stay in the cloud',
              icon: Icons.delete_outline_outlined,
            ),
            AlternativeList(
              title: 'Change Phone Number',
              subtitle: 'Move your accounts,chats adn media to a new number',
              icon: Icons.login_outlined,
            ),
            AlternativeList(
              onTap: () {
                showDialog(
                    context: context, builder: (ctx) => AskQuestionDiolog());
              },
              title: 'Contact Support',
              subtitle:
                  'Tell us about any issues; logging out doesnt usually help.',
              icon: Icons.contact_phone_outlined,
            )
          ],
        ),
      ),
    );
  }
}
