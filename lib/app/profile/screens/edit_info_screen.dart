import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/screens/add_personal_channel.dart';
import 'package:telegramm_app/app/profile/screens/birthday_screen.dart';
import 'package:telegramm_app/app/profile/screens/settings_screen.dart';
import 'package:telegramm_app/core/buttons/app_button.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class EditInfoScreen extends StatefulWidget {
  const EditInfoScreen({super.key});

  @override
  State<EditInfoScreen> createState() => _EditInfoScreenState();
}

class _EditInfoScreenState extends State<EditInfoScreen> {
  DateTime dateTime = DateTime(2025, 2, 1, 10, 20);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Profile info'),
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.arrow_back),
        // ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your name',
                    style: TextTheme.of(
                      context,
                    ).titleMedium?.copyWith(color: AppColors.primary),
                  ),
                  Text('Max', style: TextTheme.of(context).titleMedium),
                  Divider(color: Colors.grey[300]),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Last name',
                      hintStyle: TextStyle(color: AppColors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your channel',
                    style: TextTheme.of(
                      context,
                    ).titleMedium?.copyWith(color: AppColors.primary),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Personal channel',
                        style: TextTheme.of(context).titleMedium,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => AddPersonalChannel(),
                          ),
                        ),
                        child: Text(
                          'Add',
                          style: TextTheme.of(
                            context,
                          ).titleMedium?.copyWith(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your bio',
                    style: TextTheme.of(
                      context,
                    ).titleMedium?.copyWith(color: AppColors.primary),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write about yourself...',
                      hintStyle: TextStyle(color: AppColors.grey),
                      suffix: Text('70'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text.rich(
              TextSpan(
                text:
                    'You can add a few lines about yourself. Choose who can see your bio in ',
                children: [
                  TextSpan(
                    text: 'Settings',
                    style: TextStyle(color: AppColors.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => SettingsScreen()),
                        );
                      },
                  ),
                  TextSpan(text: '.'),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your birthday',
                    style: TextTheme.of(
                      context,
                    ).titleMedium?.copyWith(color: AppColors.primary),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Birthday',
                        style: TextTheme.of(context).titleMedium,
                      ),
                      GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) => Material(
                              child: Container(
                                height: 350,
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: const Text(
                                        'Birthday',

                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: CupertinoDatePicker(
                                        initialDateTime: dateTime,
                                        mode: CupertinoDatePickerMode.date,
                                        onDateTimeChanged: (DateTime newTime) {
                                          setState(() {
                                            dateTime = newTime;
                                          });
                                        },
                                      ),
                                    ),
                                    AppButton(
                                      onTap: () => Navigator.pop(context),
                                    ),
                                    SizedBox(height: 25),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Add',
                          style: TextTheme.of(
                            context,
                          ).titleMedium?.copyWith(color: AppColors.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text.rich(
              TextSpan(
                text: 'Only your contacts can see your birthday. ',
                children: [
                  TextSpan(
                    text: 'Change >',
                    style: TextStyle(color: AppColors.primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (ctx) => BirthdayScreen()),
                        );
                      },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
