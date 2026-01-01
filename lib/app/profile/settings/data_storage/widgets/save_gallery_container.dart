import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class SaveGalleryContainer extends StatefulWidget {
  const SaveGalleryContainer({super.key});

  @override
  State<SaveGalleryContainer> createState() => _SaveGalleryContainerState();
}

class _SaveGalleryContainerState extends State<SaveGalleryContainer> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Save to Gallery',
              style: TextStyle(color: AppColors.primary),
            ),
            ListTile(
              title: Text('Private Chats'),
              subtitle: Text('Off'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            ListTile(
              title: Text('Groups'),
              subtitle: Text('Off'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            ListTile(
              title: Text('Channels'),
              subtitle: Text('Off'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
