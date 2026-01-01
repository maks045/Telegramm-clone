import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/drawer/calls/new_call_screen.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back)),
        title: Text('Calls'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => NewCallScreen())),
            child: Container(
              color: AppColors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_ic_call_outlined,
                          color: AppColors.primary,
                        )),
                    Text(
                      'Start New Call',
                      style: TextTheme.of(context)
                          .titleMedium!
                          .copyWith(color: AppColors.primary),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'You can add up to 200 participants to a call.',
              style: TextStyle(color: AppColors.grey),
            ),
          )
        ],
      ),
    );
  }
}
