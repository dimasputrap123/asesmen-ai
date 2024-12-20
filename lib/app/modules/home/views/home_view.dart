import 'package:assesment/app/modules/home/views/custom_tab_bar_view.dart';
import 'package:assesment/app/modules/home/views/tab_dashboard_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  void onPressLogout() {
    Get.defaultDialog(
        title: 'Konfirmasi',
        middleText: 'Apakah anda yakin?',
        textConfirm: "Ya",
        textCancel: "Kembali",
        onConfirm: () {
          var box = GetStorage();
          box.remove('token');
          Get.offAllNamed("/login");
        });
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFFeef0f0),
      leading: Icon(
        Icons.assessment_rounded,
        size: 40,
        color: Color(0xFF1bae9f),
      ),
      actions: [
        TextButton(
            onPressed: onPressLogout,
            child: Row(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
                Text(
                  "Keluar",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ))
      ],
    );
  }

  Widget buildHeader(String name) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(
                width: 5,
              ),
              Obx(() => Text(
                    "Halo, ${controller.profile.value.name ?? "-"}",
                    style: TextStyle(fontSize: 24),
                  ))
            ],
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.info_outline))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xFFeef0f0),
        appBar: buildAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              buildHeader("Slamet"),
              SizedBox(
                height: 10,
              ),
              CustomTabBarView(labels: ['Dashboard', 'Resume']),
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: TabBarView(children: [
                Obx(() => TabDashboardView(
                      rekapData: controller.rekap.value,
                    )),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text("Tab2"),
                  ),
                ),
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
