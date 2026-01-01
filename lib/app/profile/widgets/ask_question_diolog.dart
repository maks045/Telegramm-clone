import 'package:flutter/material.dart';

class AskQuestionDiolog extends StatelessWidget {
  const AskQuestionDiolog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Ask a Question'),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            Text(
                'Please note that telegram support is done by volunteers. we try to respond as quickly as possible, but it may take a while.'),
            SizedBox(
              height: 18,
            ),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                ),
                children: [
                  const TextSpan(
                    text: 'Please take a look at the ',
                  ),
                  TextSpan(
                    text: 'Telegram FAQ',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const TextSpan(
                    text:
                        ': it has answers to most questions and important tips for ',
                  ),
                  TextSpan(
                    text: 'troubleshooting',
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Ask a volunteer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
