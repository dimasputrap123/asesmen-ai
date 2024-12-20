import 'package:assesment/app/data/login_data.dart';
import 'package:assesment/http/client.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var obscure = true.obs;
  var isLoading = false.obs;

  void obscureToggle() => obscure.value = !obscure.value;

  Future<bool> login(String username, String password) async {
    isLoading.value = true;
    try {
      final formdata =
          dio.FormData.fromMap({'email': username, 'password': password});
      final response = await DioClient().dio.request("/login",
          options: dio.Options(method: 'POST'), data: formdata);
      isLoading.value = false;
      var body = response.data;
      var data = LoginData.fromJson(body['data']);
      final box = GetStorage();
      box.write('token', data.token);
      return true;
    } on dio.DioException catch (e) {
      isLoading.value = false;
      Get.snackbar("Alert", e.response?.data['message'] ?? "internal error",
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 2),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
      return false;
    }
  }
}
