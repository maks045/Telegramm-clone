import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/widgets/build_user_list.dart';
import 'package:telegramm_app/core/divider/custom_divider.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('invite friend'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search contacts',
                    hintStyle: TextStyle(color: AppColors.grey),
                    border: InputBorder.none),
              ),
            ),
            CustomDivider(),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('Share Telegram...'),
            ),
            CustomDivider(),
            Expanded(child: BuildUserList()),
            Container(
              width: double.infinity,
              height: 30,
              color: Colors.green,
              alignment: Alignment.center,
              child: Text(
                'Select contacts to invite them to Telegram',
                style: TextStyle(color: AppColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
