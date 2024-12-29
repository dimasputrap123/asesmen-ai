import 'package:assesment/app/modules/listdata/views/listcard_view.dart';
import 'package:assesment/http/client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class ListdataController extends GetxController {
  var listAsesmen = <AsesmenItem>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchdata();
  }

  Future<void> fetchdata() async {
    isLoading.value = true;
    try {
      final formdata = dio.FormData.fromMap({'page': 0, 'per_page': 10});
      final response =
          await DioClient().dio.post("/kpm-blm-asesmen", data: formdata);
      isLoading.value = false;
      final body = response.data;
      final data = body['data'] as List;
      final tmp = <AsesmenItem>[];
      for (var e in data) {
        tmp.add(AsesmenItem(
            id: e['id'], nik: e['nik'], alamat: e['alamat'], nama: e['nama']));
      }
      listAsesmen.value = tmp;
    } on dio.DioException catch (e) {
      Get.snackbar("Alert", e.response?.data['message'] ?? "internal error",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
      isLoading.value = false;
    }
  }
}
