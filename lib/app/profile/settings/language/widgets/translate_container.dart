import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class TranslateContainer extends StatefulWidget {
  const TranslateContainer({super.key});

  @override
  State<TranslateContainer> createState() => _TranslateContainerState();
}

class _TranslateContainerState extends State<TranslateContainer> {
  bool onValue = false;

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
              'Translate Messages',
              style: TextTheme.of(context)
                  .titleMedium!
                  .copyWith(color: AppColors.primary),
            ),
            ListTile(
              title: Text('Show Translate Button'),
              trailing: Switch(
                  value: onValue,
                  onChanged: (value) {
                    setState(() {
                      onValue = value;
                    });
                  }),
            ),
            ListTile(
              title: Text('Show Entire Chats'),
              trailing: Switch(
                  value: onValue,
                  onChanged: (value) {
                    setState(() {
                      onValue = value;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
