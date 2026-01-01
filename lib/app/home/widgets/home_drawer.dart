import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/drawer/widgets/drawer_header.dart';
import 'package:telegramm_app/app/home/widgets/custom_list_tile.dart';
import 'package:telegramm_app/core/divider/custom_divider.dart';
import 'package:telegramm_app/app/home/drawer/calls/calls_screen.dart';
import 'package:telegramm_app/app/home/drawer/contacts/cantacts_screen.dart';
import 'package:telegramm_app/app/home/drawer/invite_friend/invite_friends_screen.dart';
import 'package:telegramm_app/app/home/drawer/my_profile/my_profile_screen.dart';
import 'package:telegramm_app/app/home/drawer/new_group/new_group_screen.dart';
import 'package:telegramm_app/app/home/drawer/saved_mess/saved_messages.dart';
import 'package:telegramm_app/app/profile/profile_screen.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: 350,
        child: ListView(padding: EdgeInsets.zero, children: [
          CustomDrawerHeader(),
          CustomListTile(
              icon: Icons.person_2_outlined,
              title: 'My Profile',
              page: const MyProfileScreen()),
          CustomDivider(),
          CustomListTile(
              icon: Icons.group_outlined,
              title: 'New Group',
              page: const NewGroupScreen()),
          CustomListTile(
              icon: Icons.contacts_outlined,
              title: 'Contacts',
              page: const ContactsScreen()),
          CustomListTile(
              icon: Icons.call_outlined,
              title: 'Calls',
              page: const CallsScreen()),
          CustomListTile(
              icon: Icons.bookmark_border,
              title: 'Saved Messages',
              page: const SavedMessagesScreen()),
          CustomListTile(
              icon: Icons.settings,
              title: 'Settings',
              page: const ProfileScreen()),
          CustomDivider(),
          CustomListTile(
              icon: Icons.person_add_alt,
              title: 'Invite Friends',
              page: const InviteFriendsScreen()),
        ]));
  }
}
