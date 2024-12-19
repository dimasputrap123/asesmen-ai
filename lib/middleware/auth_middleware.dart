import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final box = GetStorage();
    String? token = box.read('token');
    // Cek kondisi login di sini
    var isLoggedIn = token != null; // Ganti dengan logika autentikasi Anda
    if (!isLoggedIn) {
      return RouteSettings(
          name: '/login'); // Redirect ke halaman login jika belum login
    }
    return null;
  }
}
