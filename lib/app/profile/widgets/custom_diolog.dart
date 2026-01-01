import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telegramm_app/app/profile/screens/edit_info/edit_info_screen.dart';
import 'package:telegramm_app/app/profile/screens/logout/logout_screen.dart';

class CustomDiolog extends StatefulWidget {
  const CustomDiolog({super.key});

  @override
  State<CustomDiolog> createState() => _CustomDiologState();
}

class _CustomDiologState extends State<CustomDiolog> {
  // ignore: unused_field
  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
                onTap: () async {
                  final XFile? pickedFile = await _picker.pickImage(
                    source: ImageSource.gallery,
                  );
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
              ),
              ListTile(
                  leading: Icon(Icons.save_alt_rounded),
                  title: Text('Save to Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          Future.delayed(Duration(seconds: 2), () {
                            Navigator.pop(context);
                          });
                          return SafeArea(
                            child: SizedBox(
                              height: 50,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.save_alt,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  const Text('Photo saved to gallery'),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => LogoutScreen()),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
