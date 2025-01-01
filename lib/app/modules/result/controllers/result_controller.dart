import 'dart:convert';

import 'package:assesment/app/modules/survey/controllers/survey_controller.dart';
import 'package:assesment/http/client.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  var isLoading = false.obs;
  var rekomendasi = "".obs;
  var kategori = "".obs;

  @override
  void onInit() {
    super.onInit();
    getPrediksi();
  }

  Future<void> getPrediksi() async {
    final surveyController = Get.find<SurveyController>();
    String jsonData = jsonEncode(
        surveyController.listSurveyJawaban.map((e) => e.toJson()).toList());
    try {
      isLoading.value = true;
      final formData = dio.FormData.fromMap({'surveys': jsonData});
      final response = await DioClient().dio.request("/prediksi",
          options: dio.Options(method: 'POST'), data: formData);
      isLoading.value = false;
      final body = response.data;
      rekomendasi.value = body['data']['rekomendasi_bantuan'];
      kategori.value = body['data']['kategori'];
    } on dio.DioException catch (e) {
      isLoading.value = false;
      Get.snackbar("Alert", e.response?.data['message'] ?? "internal error",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
  }
}
