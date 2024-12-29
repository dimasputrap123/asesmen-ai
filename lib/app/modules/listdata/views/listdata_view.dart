import 'package:assesment/app/modules/listdata/views/listcard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/listdata_controller.dart';

class ListdataView extends GetView<ListdataController> {
  const ListdataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prelist Asesmen'),
        centerTitle: true,
      ),
      body: Obx(() => controller.isLoading.value
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator(), Text("Sedang Memuat")],
              ),
            )
          : ListView.builder(
              itemCount: controller.listAsesmen.length,
              itemBuilder: (context, index) => ListcardView(
                item: controller.listAsesmen[index],
                onTap: (id) {
                  Get.toNamed("/survey", arguments: id);
                },
              ),
            )),
    );
  }
}
