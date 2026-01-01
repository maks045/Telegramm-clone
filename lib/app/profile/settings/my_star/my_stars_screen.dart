import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class MyStarsScreen extends StatelessWidget {
  const MyStarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: AppColors.backgroundcolor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ))),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(width: 200, child: Lottie.asset('assets/emoji/star.json')),
            Text(
              'Telegram Stars',
              style: TextTheme.of(context).titleLarge,
            ),
            Text(
                textAlign: TextAlign.center,
                'Buy Srars to unlock content and services\nin mini apps on Telegram.'),
            SizedBox(
              height: 18,
            ),
            Container(
              color: AppColors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 50,
                          child: Lottie.asset('assets/emoji/star.json')),
                      Text(
                        '0',
                        style: TextTheme.of(context).titleLarge,
                      )
                    ],
                  ),
                  Text('your balance'),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    alignment: Alignment.center,
                    child: Text('Buy Stars'),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.group_add_outlined,
                        color: AppColors.primary,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Gift Stars to Friends',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              color: AppColors.white,
              child: ListTile(
                leading: Icon(Icons.castle, color: Colors.green),
                title: Row(
                  children: [
                    Text('Earn stars'),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(8)),
                      alignment: Alignment.center,
                      child: Text(
                        'NEW',
                        style: TextStyle(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
                subtitle: Text(
                    'Distribute links to mini apps and earn a share of their revenue in Stars.'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
