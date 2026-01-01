import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/drawer/contacts/new_channel.dart';
import 'package:telegramm_app/app/home/drawer/my_profile/screen/add_new_group.dart';
import 'package:telegramm_app/app/home/widgets/build_user_list.dart';
import 'package:telegramm_app/core/buttons/app_button.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text('New Group'),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => AddNewGroup())),
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text('New Contact'),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (ctx) => SafeArea(
                                child: SizedBox(
                                  height: 350,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'New Contact',
                                          style:
                                              TextTheme.of(context).titleLarge,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            label:
                                                Text('First name (required)'),
                                          ),
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            label: Text('Last name (optional)'),
                                          ),
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            labelText: 'Phone number',
                                          ),
                                        ),
                                        AppButton(
                                          onTap: () {},
                                          title: 'Create Contact',
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ));
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.group),
                    title: Text('New Channel'),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => NewChannelScreen())),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.grey[200],
              width: double.infinity,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  'Sorted by last seen time',
                  style: TextStyle(
                    color: AppColors.grey,
                  ),
                ),
              ),
            ),
            Expanded(child: BuildUserList())
          ],
        ),
      ),
    );
  }
}
