import 'package:flutter/material.dart';
import 'package:telegramm_app/app/home/widgets/build_user_list.dart';
import 'package:telegramm_app/app/home/widgets/fab_chat.dart';
import 'package:telegramm_app/app/home/widgets/home_drawer.dart';
import 'package:telegramm_app/core/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text('Telegram'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: HomeDrawer(),
      body: BuildUserList(),
      floatingActionButton: FabChat(),
      resizeToAvoidBottomInset: null,
    );
  }
}
