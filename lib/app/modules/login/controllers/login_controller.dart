import 'package:assesment/app/data/login_data.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  var obscure = true.obs;
  var isLoading = false.obs;
  var name = "".obs;

  void obscureToggle() => obscure.value = !obscure.value;

  Future<bool> login(String username, String password) async {
    isLoading.value = true;
    try {
      final formdata =
          dio.FormData.fromMap({'email': username, 'password': password});
      final response = await dio.Dio().request(
          "http://127.0.0.1:8000/api/login",
          options: dio.Options(method: 'POST'),
          data: formdata);
      isLoading.value = false;
      var body = response.data;
      var data = LoginData.fromJson(body['data']);
      final box = GetStorage();
      name.value = data.name ?? "";
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
