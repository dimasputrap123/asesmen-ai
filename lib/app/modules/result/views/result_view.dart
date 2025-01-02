import 'package:assesment/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/result_controller.dart';

class ResultView extends GetView<ResultController> {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final inputController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hasil Prediksi Survey',
          style: TextStyle(fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: Obx(() => SafeArea(
              child: Container(
            padding: EdgeInsets.all(15),
            child: controller.isLoading.value
                ? Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text("Sedang Memuat")
                      ],
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hasil Perkiraan : ",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Kategori Asesmen : ${controller.kategori.value}",
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                              "Rekomendasi Bantuan : ${controller.rekomendasi.value}",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Keterangan Bantuan : ",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Program Keluarga Harapan (PKH) merupakan bantuan sosial yang diberikan kepada keluarga miskin untuk  meningkatkan kesejahteraan",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Catatan Survey : ",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              maxLines: 4,
                              controller: inputController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(),
                                    borderRadius: BorderRadius.circular(10)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF1bae9f)),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Harus diisi!";
                                }
                                return null;
                              },
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Batal",
                                  style: TextStyle(
                                      color: selectedText,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                )),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: controller.isLoadingSave.value
                                  ? null
                                  : () async {},
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 50),
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 10),
                                backgroundColor: controller.isLoadingSave.value
                                    ? Colors.grey.shade400
                                    : Color(0xFF1bae9f),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  controller.isLoading.value
                                      ? Container(
                                          margin: EdgeInsets.only(right: 5),
                                          child: Transform.scale(
                                            scale: 0.2,
                                            child: CircularProgressIndicator(
                                              color: Colors.green,
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                  Text(
                                    "Simpan",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
          ))),
    );
  }
}
