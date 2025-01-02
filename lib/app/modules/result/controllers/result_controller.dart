import 'dart:convert';

import 'package:assesment/app/modules/survey/controllers/survey_controller.dart';
import 'package:assesment/http/client.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  final isLoading = false.obs;
  final isLoadingSave = true.obs;
  final isSaveSuccess = false.obs;
  final rekomendasi = "".obs;
  final kategori = "".obs;

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

  Future<void> saveSurvey(int idKpm, String catatan) async {
    final surveyController = Get.find<SurveyController>();
    String jsonData = jsonEncode(
        surveyController.listSurveyJawaban.map((e) => e.toJson()).toList());
    try {
      isLoadingSave.value = true;
      final formData = dio.FormData.fromMap({
        'id_kpm': idKpm,
        'kategori_pred': kategori.value,
        'kategori_man': kategori.value,
        'rekomendasi_pred': rekomendasi.value,
        'rekomendasi_man': rekomendasi.value,
        'catatan': catatan,
        'surveys': jsonData
      });
      final response = await DioClient().dio.request("/tambahSurvey",
          options: dio.Options(method: 'POST'), data: formData);
      final body = response.data;
      if (body['status']) {
        isSaveSuccess.value = true;
      }
      isLoadingSave.value = false;
    } on dio.DioException catch (e) {
      isSaveSuccess.value = false;
      isLoadingSave.value = false;
      Get.snackbar("Alert", e.response?.data['message'] ?? "internal error",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
  }
}
