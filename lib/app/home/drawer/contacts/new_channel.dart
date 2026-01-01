import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/drawer/my_profile/widget/name_group.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class NewChannelScreen extends StatelessWidget {
  const NewChannelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Channel'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.check))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameGroupContainer(hintText: 'Channel name'),
            TextField(
              decoration: InputDecoration(
                  hintText: 'Description',
                  hintStyle: TextTheme.of(context)
                      .titleMedium!
                      .copyWith(color: AppColors.grey)),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'You can provide an optional description for\nyour channel',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
