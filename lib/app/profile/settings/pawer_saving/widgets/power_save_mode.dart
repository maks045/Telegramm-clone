import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class PowerSaveMode extends StatefulWidget {
  const PowerSaveMode({super.key});

  @override
  State<PowerSaveMode> createState() => _PowerSaveModeState();
}

class _PowerSaveModeState extends State<PowerSaveMode> {
  double sliderVal = 50.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Power Saving Mode',
                  style: TextTheme.of(context)
                      .titleMedium!
                      .copyWith(color: AppColors.primary),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  child: Text(
                    'OFF',
                    style: TextStyle(color: AppColors.primary),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text('Off'),
                Spacer(),
                Text(
                  'When below 10%',
                  style: TextStyle(color: AppColors.primary),
                ),
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.battery_1_bar_outlined,
                  color: AppColors.primary,
                ),
                Spacer(),
                Text('On')
              ],
            ),
            Slider(
                value: sliderVal,
                divisions: 10,
                max: 100.0,
                label: '${sliderVal.round()}',
                onChanged: (double value) {
                  setState(() {
                    sliderVal = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
