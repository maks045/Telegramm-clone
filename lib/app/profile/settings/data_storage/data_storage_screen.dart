import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/settings/data_storage/widgets/data_media_container.dart';
import 'package:telegramm_app/app/profile/settings/data_storage/widgets/save_gallery_container.dart';
import 'package:telegramm_app/core/appbar/app_appbar.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class DataStorageScreen extends StatelessWidget {
  const DataStorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppAppbar(
        title: 'Data and Storage',
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Disk and network usage',
                    style: TextStyle(color: AppColors.primary),
                  ),
                  ListTile(
                    leading: Icon(Icons.storage_outlined),
                    title: Text('Stroge Usage'),
                    trailing: Text('192.3 MB'),
                  ),
                  ListTile(
                    leading: Icon(Icons.bar_chart_outlined),
                    title: Text('Data Usage'),
                    trailing: Text('592.3 MB'),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          DataMediaContainer(),
          SizedBox(
            height: 12,
          ),
          SaveGalleryContainer()
        ],
      ),
    );
  }
}
