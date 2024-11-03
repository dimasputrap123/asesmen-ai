import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AsesmenItemView extends GetView {
  const AsesmenItemView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AsesmenItemView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AsesmenItemView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
