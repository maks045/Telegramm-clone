import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class InAppContainer extends StatefulWidget {
  const InAppContainer({super.key});

  @override
  State<InAppContainer> createState() => _InAppContainerState();
}

class _InAppContainerState extends State<InAppContainer> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'In-App notifications',
              style: TextStyle(color: AppColors.primary),
            ),
            ListTile(
              title: Text('Inn-App Sounds'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {});
                  }),
            ),
            ListTile(
              title: Text('Inn-App Vibrate'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {});
                  }),
            ),
            ListTile(
              title: Text('Inn-App Preview'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {});
                  }),
            ),
            ListTile(
              title: Text('Inn-Chat Sounds'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {});
                  }),
            ),
            ListTile(
                title: Text('Inn-App Pop on Screen'),
                subtitle: Text('Show pop-up notifications while in app.'),
                trailing: Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {});
                    })),
          ],
        ),
      ),
    );
  }
}
