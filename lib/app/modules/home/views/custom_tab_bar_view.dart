import 'package:assesment/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CustomTabBarView extends GetView {
  final List<String> labels;
  const CustomTabBarView({super.key, required this.labels});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: selectedTab,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          labelColor: selectedTabLabel,
          unselectedLabelColor: unselectedTabLabel,
          tabs: [for (var item in labels) Text(item)]),
    );
  }
}
