// my_profile_screen.dart
import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/drawer/widgets/custom_tab.dart';
import 'package:telegramm_app/app/home/drawer/widgets/emty_state.dart';
import 'package:telegramm_app/app/home/drawer/widgets/info_container.dart';
import 'package:telegramm_app/app/profile/screens/edit_info/edit_info_screen.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  static const List<Tab> _tabs = [
    Tab(text: 'Posts'),
    Tab(text: 'Archived'),
  ];

  static const List<Widget> _pages = [
    EmptyPosts(),
    EmptyStories(),
  ];

  static Widget _header() {
    return const Column(
      children: [
        SizedBox(height: 40),
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(
            'https://www.worldatlas.com/r/w1200/upload/79/07/6d/masjid-al-haram.jpg',
          ),
        ),
        SizedBox(height: 12),
        Text('Max', style: TextStyle(fontSize: 20, color: Colors.black)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        body: SafeArea(
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                pinned: true,
                expandedHeight: 250,
                backgroundColor: AppColors.primary,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, color: Colors.black),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EditInfoScreen(),
                      ),
                    ),
                  ),
                ],
                flexibleSpace: innerBoxIsScrolled
                    ? null
                    : FlexibleSpaceBar(background: _header()),
              ),
              const SliverToBoxAdapter(child: InfoContainer()),
            ],
            body: CustomTab(tabs: _tabs, pages: _pages),
          ),
        ),
      ),
    );
  }
}
