import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/drawer/my_profile/screen/add_new_group.dart';
import 'package:telegramm_app/app/home/widgets/build_user_list.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class NewGroupScreen extends StatelessWidget {
  const NewGroupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('New Group'),
            Text(
              'up to 200000 members',
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
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Who would you like to add?',
                ),
              ),
            ),
          ),
          Expanded(child: BuildUserList()),
        ],
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => AddNewGroup()));
          },
          shape: CircleBorder(),
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}
