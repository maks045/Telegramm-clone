import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telegramm_app/app/profile/screens/edit_info_screen.dart';
import 'package:telegramm_app/app/profile/screens/logout_screen.dart';
import 'package:telegramm_app/app/profile/screens/search_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (ctx) => SearchScreen()),
                ),
                icon: Icon(Icons.search),
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      actions: <Widget>[
                        ListTile(
                          leading: Icon(Icons.edit),
                          title: Text('Edit info'),
                          onTap: () {
                            Navigator.pop(context);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => EditInfoScreen(),
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.add_a_photo),
                          title: Text('Set Profile Photo'),
                          onTap: () {
                            Navigator.pop(
                              context,
                            ); // close the alert dialog first
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Pick Profile Photo'),
                                content: _image != null
                                    ? Image.file(
                                        _image!,
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      )
                                    : Text('No image selected'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      final XFile? pickedFile = await _picker
                                          .pickImage(
                                            source: ImageSource.gallery,
                                          );
                                      if (pickedFile != null) {
                                        setState(() {
                                          _image = File(pickedFile.path);
                                        });
                                      }
                                      Navigator.pop(
                                        context,
                                      ); // close the dialog
                                    },
                                    child: Text('Pick from Gallery'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.change_circle_outlined),
                          title: Text('Change profile color'),
                        ),
                        ListTile(
                          leading: Icon(Icons.logout),
                          title: Text('Log Out'),
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (ctx) => LogoutScreen()),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Max'),
              background: Center(
                child: SizedBox(
                  width: 120,
                  height: 120,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      scale: 23,
                      'https://www.worldatlas.com/r/w1200/upload/79/07/6d/masjid-al-haram.jpg',
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Account'),
                  Text('+123 456 7890'),
                  Text('Tap to change phone number'),
                  Divider(),
                  Text('None'),
                  Text('Username'),
                  Divider(),
                  Text('Bio'),
                  Text('Add a few words about yourself'),
                  Divider(),
                  Text('Settings'),
                  ListTile(
                    leading: Icon(Icons.chat_bubble_outlined),
                    title: Text('Chat Settings'),
                  ),
                  ListTile(
                    leading: Icon(Icons.security),
                    title: Text('Privacy and Security'),
                  ),
                  ListTile(
                    leading: Icon(Icons.notification_important),
                    title: Text('Notifications and Sounds'),
                  ),
                  ListTile(
                    leading: Icon(Icons.add_chart_rounded),
                    title: Text('Data and Storage'),
                  ),
                  ListTile(
                    leading: Icon(Icons.battery_1_bar_sharp),
                    title: Text('Power Saving'),
                  ),
                  ListTile(
                    leading: Icon(Icons.folder),
                    title: Text('Chat Folders'),
                  ),
                  ListTile(
                    leading: Icon(Icons.computer),
                    title: Text('Devices'),
                  ),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text('Language'),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Telegram Premium'),
                  ),
                  ListTile(
                    leading: Icon(Icons.star_border_outlined),
                    title: Text('My Stars'),
                  ),
                  ListTile(
                    leading: Icon(Icons.shop),
                    title: Text('Telegram Business'),
                  ),
                  ListTile(
                    leading: Icon(Icons.card_giftcard),
                    title: Text('Send a Gift'),
                  ),
                  Divider(),
                  Text('Help'),
                  ListTile(
                    leading: Icon(Icons.chat_sharp),
                    title: Text('Ask a Question'),
                  ),
                  ListTile(
                    leading: Icon(Icons.question_mark_rounded),
                    title: Text('Telegram FAQ'),
                  ),
                  ListTile(
                    leading: Icon(Icons.privacy_tip),
                    title: Text('Privacy Policy'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Telegram for Android v12.1.1 (5334) store bundled arm64-v8a',
                    textAlign: TextAlign.center,
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
