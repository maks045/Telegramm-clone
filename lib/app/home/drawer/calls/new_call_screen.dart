import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/widgets/build_user_list.dart';
import 'package:telegramm_app/core/buttons/app_button.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class NewCallScreen extends StatelessWidget {
  const NewCallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New Call'),
            Text(
              'up to 200 members',
              style: TextTheme.of(context)
                  .titleSmall!
                  .copyWith(color: AppColors.white),
            )
          ],
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: Offset(0, 5),
              )
            ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search for contacta or usernames...',
                      hintStyle: TextStyle(color: AppColors.grey),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (ctx) => SizedBox(
                                width: double.infinity,
                                height: 450,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 200,
                                            decoration: BoxDecoration(
                                                color: AppColors.primary,
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.link,
                                              size: 80,
                                              color: AppColors.white,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.more_vert))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Text('Call Link'),
                                      Text(
                                          'Anyone. on Telegra can join your\ncall by following the link below'),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  't.me/calL/9V4mhs83AQIAH_pn34nfPfe5A'),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(Icons.more_vert))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: AppButton(
                                                  onTap: () {}, title: 'Copy')),
                                          Expanded(
                                              child: AppButton(
                                                  onTap: () {},
                                                  title: 'Share')),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              thickness: 1,
                                              color: AppColors.grey,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text('or'),
                                          ),
                                          Expanded(
                                            child: Divider(
                                              thickness: 1,
                                              color: AppColors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                      Text.rich(TextSpan(
                                          text:
                                              'Be the first to join the call and add\npeople from there.',
                                          children: [
                                            TextSpan(
                                                text: 'Open Call >',
                                                style: TextStyle(
                                                    color: AppColors.primary),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (ctx) =>
                                                                    Scaffold()));
                                                      })
                                          ]))
                                    ],
                                  ),
                                ),
                              ));
                    },
                    leading: Icon(
                      Icons.link,
                      color: AppColors.primary,
                    ),
                    title: Text(
                      'Create Call Link',
                      style: TextTheme.of(context)
                          .titleMedium!
                          .copyWith(color: AppColors.primary),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: BuildUserList()),
        ],
      ),
    );
  }
}
