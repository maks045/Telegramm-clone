import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key});

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
                'Info',
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
                'Mobile',
                style: TextTheme.of(context)
                    .titleSmall!
                    .copyWith(color: AppColors.grey),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        '@name',
                        style: TextTheme.of(context).titleMedium,
                      ),
                      Text(
                        'Username',
                        style: TextTheme.of(context)
                            .titleSmall!
                            .copyWith(color: AppColors.grey),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.qr_code,
                        color: AppColors.primary,
                      ))
                ],
              ),
            ],
          ),
        ));
  }
}
