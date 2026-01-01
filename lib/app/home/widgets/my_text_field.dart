import 'package:flutter/material.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final ValueChanged<String>? onSubmitted;

  const MyTextField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.obscureText = false,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          hintText: hintText,
          hintStyle: TextTheme.of(context)
              .titleMedium!
              .copyWith(color: AppColors.grey),
          border: InputBorder.none),
    );
  }
}


// Container(
//       height: 50,
//       decoration: BoxDecoration(color: Colors.white),
//       child: Row(
//         children: [
//           IconButton(onPressed: () {}, icon: Icon(Icons.face_6_outlined)),
//           TextField(
//             controller: controller,
//             obscureText: obscureText,
//             onSubmitted: onSubmitted,
//             decoration: InputDecoration(
//               hintText: hintText,
//               border: InputBorder.none,
//             ),
//           ),
//           IconButton(
//               onPressed: () {}, icon: Icon(Icons.share_location_outlined)),
//           IconButton(onPressed: () {}, icon: Icon(Icons.voice_chat)),
//         ],
//       ),
//     );