import 'package:flutter/material.dart';
import 'package:telegramm_app/core/divider/custom_divider.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class AccountInfoContainer extends StatelessWidget {
  const AccountInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: AppColors.white),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: TextTheme.of(context)
                    .titleMedium!
                    .copyWith(color: AppColors.primary),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '+123 456 7890',
                style: TextTheme.of(context).titleMedium,
              ),
              Text(
                'Tap to change phone number',
                style: TextTheme.of(context)
                    .titleSmall!
                    .copyWith(color: AppColors.grey),
              ),
              CustomDivider(),
              Text(
                'None',
                style: TextTheme.of(context).titleMedium,
              ),
              Text(
                'Username',
                style: TextTheme.of(context)
                    .titleSmall!
                    .copyWith(color: AppColors.grey),
              ),
              CustomDivider(),
              Text(
                'Bio',
                style: TextTheme.of(context).titleMedium,
              ),
              Text(
                'Add a few words about yourself',
                style: TextTheme.of(context)
                    .titleSmall!
                    .copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ));
  }
}
