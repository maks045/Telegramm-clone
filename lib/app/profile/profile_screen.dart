import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/widgets/custom_sliver_appbar.dart';
import 'package:telegramm_app/app/profile/widgets/custom_sliver_tobox_adapter.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            const CustomSliverAppbar(),
            const CustomSliverToboxAdapter(),
          ],
        ),
      ),
    );
  }
}
