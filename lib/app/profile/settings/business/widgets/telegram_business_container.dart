import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class TelegramBusinessContainer extends StatelessWidget {
  const TelegramBusinessContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.location_on_outlined,
              color: Colors.deepOrange,
            ),
            title: Text('Location'),
            subtitle: Text(
              'Display the location of your business on your accaount.',
              style: TextStyle(color: AppColors.grey),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.timelapse_outlined,
              color: Colors.deepOrange,
            ),
            title: Text('Opening Hours'),
            subtitle: Text(
              'Show to your customers when you are open for business.',
              style: TextStyle(color: AppColors.grey),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.arrow_circle_left_outlined,
              color: Colors.deepOrange,
            ),
            title: Text('Quick Replies'),
            subtitle: Text(
              'Set up shortcuts with rich text and media to respond to message faster.',
              style: TextStyle(color: AppColors.grey),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
