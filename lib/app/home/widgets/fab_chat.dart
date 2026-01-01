import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telegramm_app/app/home/screens/new_message_screen.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class FabChat extends StatefulWidget {
  const FabChat({super.key});

  @override
  State<FabChat> createState() => _FabChatState();
}

class _FabChatState extends State<FabChat> {
  // ignore: unused_field
  File? _image;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 45.0,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => NewMessageScreen()));
            },
            shape: CircleBorder(),
            child: Icon(
              Icons.edit_rounded,
              color: AppColors.grey,
            ),
          ),
        ),
        SizedBox(
          width: 60.0,
          height: 60.0,
          child: FloatingActionButton(
            onPressed: () async {
              final XFile? pickedFile =
                  await _picker.pickImage(source: ImageSource.camera);
              if (pickedFile != null) {
                setState(() {
                  _image = File(pickedFile.path);
                });
              }
            },
            shape: const CircleBorder(),
            child:
                const Icon(Icons.photo_camera_rounded, color: AppColors.white),
          ),
        )
      ],
    );
  }
}
