import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const UserTile({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            Icons.account_circle_outlined,
            size: 70,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextTheme.of(context).titleMedium,
          )
        ],
      ),
    );
  }
}
