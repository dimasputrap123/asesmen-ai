import 'package:assesment/app/data/rekap_data.dart';
import 'package:assesment/app/modules/home/views/card_rekap_view.dart';
import 'package:assesment/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class TabDashboardView extends GetView {
  final RekapData rekapData;
  const TabDashboardView({super.key, required this.rekapData});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Rekap Asesmen",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            CardRekapView(
              title: "Belum Asesmen",
              count: rekapData.belum_asesmen ?? 0,
              color: cardpending,
              icon: Icons.pending_actions_sharp,
              onTap: () {
                Get.toNamed('/listdata');
              },
            ),
            SizedBox(
              height: 10,
            ),
            CardRekapView(
                title: "Sudah Asesmen",
                count: rekapData.sudah_asesmen ?? 0,
                color: cardprogress,
                icon: Icons.check_box_outlined),
            SizedBox(
              height: 10,
            ),
            CardRekapView(
                title: "Tidak Ditemukan",
                count: rekapData.tidak_ditemukan ?? 0,
                color: cardwarning,
                icon: Icons.not_interested),
            SizedBox(
              height: 10,
            ),
            CardRekapView(
                title: "Meninggal",
                count: rekapData.meninggal ?? 0,
                color: carderror,
                icon: Icons.error_outline),
          ],
        ),
      ),
    );
  }
}
