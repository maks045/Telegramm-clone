import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/drawer/my_profile/widget/name_group.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class AddNewGroup extends StatelessWidget {
  const AddNewGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('New Group'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NameGroupContainer(hintText: 'Enter group name'),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          actions: [
                            ListTile(
                              leading: Icon(Icons.access_time),
                              title: Text('1 day'),
                            ),
                            ListTile(
                              leading: Icon(Icons.calendar_today),
                              title: Text('1 week'),
                            ),
                            ListTile(
                              leading: Icon(Icons.event),
                              title: Text('1 month'),
                            ),
                            ListTile(
                              leading: Icon(Icons.tune),
                              title: Text('Set custom time'),
                            )
                          ],
                        ));
              },
              child: Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.av_timer_outlined),
                      Text(
                        'Auto-Delete Message',
                        style: TextTheme.of(context).titleMedium,
                      ),
                      Text('Off', style: TextStyle(color: AppColors.primary))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Automatically delete messages in this group for\neveryone after a period of time.',
                style: TextTheme.of(context)
                    .titleSmall!
                    .copyWith(color: AppColors.grey),
              ),
            ),
          ],
        ),
        floatingActionButton: SizedBox(
            width: 70,
            height: 70,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => AddNewGroup()));
              },
              shape: CircleBorder(),
              child: Icon(Icons.check),
            )));
  }
}
