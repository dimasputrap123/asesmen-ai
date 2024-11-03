import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomTabBarView extends GetView {
  final List<String> labels;
  const CustomTabBarView({super.key, required this.labels});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Container(
        height: 40,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: Colors.white,
        ),
        child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: Color(0xff1dad9e),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black54,
            tabs: [for (var item in labels) Text(item)]),
      ),
    );
  }
}
