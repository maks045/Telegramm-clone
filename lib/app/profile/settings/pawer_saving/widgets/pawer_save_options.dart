import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class PawerSaveOptions extends StatefulWidget {
  const PawerSaveOptions({super.key});

  @override
  State<PawerSaveOptions> createState() => _PawerSaveOptionsState();
}

class _PawerSaveOptionsState extends State<PawerSaveOptions> {
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
              'Power saving options',
              style: TextTheme.of(context)
                  .titleMedium!
                  .copyWith(color: AppColors.primary),
            ),
            ListTile(
              leading: Icon(Icons.animation),
              // title: Text('Animated Stickers 2/2'),
              title: ExpansionTile(
                title: Text(
                  'Animated Stickers 2/2',
                  style: TextTheme.of(context).titleSmall,
                ),
                dense: false,
                children: [
                  ListTile(
                    leading: Icon(Icons.check),
                    title: Text('Autoplay in keyboard'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check),
                    title: Text('Autoplay in chat'),
                  ),
                ],
              ),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            ListTile(
              leading: Icon(Icons.emoji_emotions_outlined),
              title: ExpansionTile(
                title: Text(
                  'Animated Stickers 1/3',
                  style: TextTheme.of(context).titleSmall,
                ),
                dense: false,
                children: [
                  ListTile(
                    leading: Icon(Icons.circle_outlined),
                    title: Text('Autoplay in keyboard'),
                  ),
                  ListTile(
                    leading: Icon(Icons.circle_outlined),
                    title: Text('Autoplay in reaction menu'),
                  ),
                  ListTile(
                    leading: Icon(Icons.check),
                    title: Text('Autoplay in chat'),
                  ),
                ],
              ),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            ListTile(
              leading: Icon(Icons.call_outlined),
              title: Text('Animations in Calls'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            ListTile(
              leading: Icon(Icons.record_voice_over),
              title: Text('Autoplay Videos'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            ListTile(
              leading: Icon(Icons.gif_box_outlined),
              title: Text('Autoplay GIFs'),
              trailing: Switch(
                  value: isSwitched,
                  onChanged: (value) {
                    setState(() {
                      isSwitched = value;
                    });
                  }),
            ),
            ListTile(
              leading: Icon(Icons.star_border_outlined),
              title: Text('Particles'),
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
