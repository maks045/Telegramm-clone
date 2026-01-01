import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class NameGroupContainer extends StatelessWidget {
  final String hintText;
  const NameGroupContainer({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.primary, shape: BoxShape.circle),
              width: 70,
              height: 70,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_a_photo,
                    color: AppColors.white,
                  )),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextTheme.of(context)
                      .titleMedium!
                      .copyWith(color: AppColors.grey),
                  suffixIcon: Icon(Icons.emoji_emotions_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
