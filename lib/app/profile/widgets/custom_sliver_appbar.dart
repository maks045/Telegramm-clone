import 'package:flutter/material.dart';
import 'package:telegramm_app/app/profile/screens/about_app/search_screen.dart';
import 'package:telegramm_app/app/profile/widgets/custom_diolog.dart';

class CustomSliverAppbar extends StatefulWidget {
  const CustomSliverAppbar({super.key});

  @override
  State<CustomSliverAppbar> createState() => _CustomSliverAppbarState();
}

class _CustomSliverAppbarState extends State<CustomSliverAppbar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => SearchScreen()),
          ),
          icon: Icon(Icons.search),
        ),
        CustomDiolog(),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: const Text('Max'),
        background: Center(
          child: SizedBox(
            width: 120,
            height: 120,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                scale: 23,
                'https://www.worldatlas.com/r/w1200/upload/79/07/6d/masjid-al-haram.jpg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
