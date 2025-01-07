import 'dart:convert';

import 'package:assesment/app/data/label_data.dart';
import 'package:assesment/app/modules/survey/controllers/survey_controller.dart';
import 'package:assesment/http/client.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultController extends GetxController {
  final isLoading = false.obs;
  final isLoadingSave = false.obs;
  final isSaveSuccess = false.obs;
  final rekomendasi = LabelData().obs;
  final kategori = LabelData().obs;
  final deskripsi = "".obs;

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
      rekomendasi.value =
          LabelData.fromJson(body['data']['rekomendasi_bantuan']);
      kategori.value = LabelData.fromJson(body['data']['kategori']);
      deskripsi.value = body['data']['deskripsi'];
    } on dio.DioException catch (e) {
      isLoading.value = false;
      Get.snackbar("Alert", e.response?.data['message'] ?? "internal error",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
  }

  Future<bool> saveSurvey(int idKpm, String catatan) async {
    final surveyController = Get.find<SurveyController>();
    String jsonData = jsonEncode(
        surveyController.listSurveyJawaban.map((e) => e.toJson()).toList());
    try {
      isLoadingSave.value = true;
      final formData = dio.FormData.fromMap({
        'id_kpm': idKpm,
        'kategori_pred': kategori.value.id,
        'kategori_man': kategori.value.id,
        'rekomendasi_pred': rekomendasi.value.id,
        'rekomendasi_man': rekomendasi.value.id,
        'catatan': catatan,
        'surveys': jsonData
      });
      final response = await DioClient().dio.request("/tambahSurvey",
          options: dio.Options(method: 'POST'), data: formData);
      final body = response.data;
      isLoadingSave.value = false;
      if (body['status']) {
        return true;
      } else {
        Get.snackbar("Alert", body['message'] ?? "internal error",
            snackPosition: SnackPosition.TOP,
            duration: const Duration(seconds: 2),
            colorText: Colors.white,
            backgroundColor: Colors.redAccent);
      }
      return false;
    } on dio.DioException catch (e) {
      isLoadingSave.value = false;
      Get.snackbar("Alert", e.response?.data['message'] ?? "internal error",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
      return false;
    }
  }
}
