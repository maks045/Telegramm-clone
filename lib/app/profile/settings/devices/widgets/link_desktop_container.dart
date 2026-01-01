import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class LinkDesktopContainer extends StatelessWidget {
  const LinkDesktopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          SizedBox(
            width: 200,
            child: Lottie.asset('assets/emoji/laptop.json'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'Link ',
                  style: TextStyle(color: AppColors.grey),
                  children: [
                    TextSpan(
                        text: 'Telegram Desktop ',
                        style: TextStyle(color: AppColors.primary)),
                    TextSpan(
                      text: 'or',
                    ),
                    TextSpan(
                        text: ' Telegram Web',
                        style: TextStyle(color: AppColors.primary)),
                    TextSpan(text: ' by scanning a QR code')
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.qr_code,
                  ),
                  Text('Link Desktop Device')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
