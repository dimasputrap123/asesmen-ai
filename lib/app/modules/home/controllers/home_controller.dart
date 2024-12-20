import 'package:assesment/app/data/profile_data.dart';
import 'package:assesment/app/data/rekap_data.dart';
import 'package:assesment/http/client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class HomeController extends GetxController {
  var rekap = RekapData().obs;
  var profile = ProfileData().obs;
  var isLoadingRekap = false.obs;
  var isLoadingProfile = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProfile();
    getRekap();
  }

  Future<void> getProfile() async {
    isLoadingProfile.value = true;
    try {
      final response = await DioClient().dio.get("/profile");
      isLoadingProfile.value = false;
      final body = response.data;
      final data = ProfileData.fromJson(body['data']);
      profile.value = data;
    } on dio.DioException catch (e) {
      Get.snackbar("Alert", e.response?.data['message'] ?? "internal error",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
      isLoadingProfile.value = false;
    }
  }

  Future<void> getRekap() async {
    isLoadingRekap.value = true;
    try {
      final response = await DioClient().dio.post("/rekap");
      isLoadingRekap.value = false;
      final body = response.data;
      final data = RekapData.fromJson(body['data']);
      rekap.value = data;
    } on dio.DioException catch (e) {
      Get.snackbar("Alert", e.response?.data['message'] ?? "internal error",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
      isLoadingRekap.value = false;
    }
  }
}
