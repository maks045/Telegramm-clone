import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final List<Tab> tabs;
  final List<Widget> pages;

  const CustomTab({
    super.key,
    required this.tabs,
    required this.pages,
  }) : assert(tabs.length == pages.length,
            'tabs and pages must have same length');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabs: tabs,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
        ),
        Expanded(
          child: TabBarView(children: pages),
        ),
      ],
    );
  }
}
