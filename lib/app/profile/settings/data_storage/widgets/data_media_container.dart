import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class DataMediaContainer extends StatefulWidget {
  const DataMediaContainer({super.key});

  @override
  State<DataMediaContainer> createState() => _DataMediaContainerState();
}

class _DataMediaContainerState extends State<DataMediaContainer> {
  bool isSwitched = true;
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
              'Automatic media download',
              style: TextStyle(color: AppColors.primary),
            ),
            ListTile(
              title: Text('When using mobile data'),
              subtitle: Text('Photos, Videos(15 MB), Files(3 MB)'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            ListTile(
              title: Text('When connected to Wi-Fi'),
              subtitle: Text('Photos, Videos(15 MB), Files(1 MB)'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            ListTile(
              title: Text('When roaming'),
              subtitle: Text('Photos'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            Text(
              'Reset Auto-Download Settings',
              style: TextStyle(color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}
