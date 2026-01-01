import 'package:flutter/material.dart';

class ChatSettingAppbar extends StatelessWidget implements PreferredSizeWidget {
  const ChatSettingAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Chat Settings'),
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        actions: [
                          ListTile(
                            leading: Icon(Icons.color_lens_outlined),
                            title: Text('Create New Theme'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.restore),
                            title: Text('Reset to default'),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ));
            },
            icon: Icon(Icons.more_vert))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
