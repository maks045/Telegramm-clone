import 'package:flutter/material.dart';

class ChutBuble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChutBuble({
    super.key,
    required this.message,
    required this.isCurrentUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
      decoration: BoxDecoration(
        color: isCurrentUser ? Colors.blue[200] : Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: isCurrentUser ? const Radius.circular(12) : Radius.zero,
          bottomRight: isCurrentUser ? Radius.zero : const Radius.circular(12),
        ),
      ),
      child: Text(message),
    );
  }
}
