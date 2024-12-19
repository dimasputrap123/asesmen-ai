import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init(); // Inisialisasi GetStorage
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  String getInitialRoute() {
    final storage = GetStorage();
    final token = storage.read('token'); // Baca token dari GetStorage
    return token == null
        ? AppPages.INITIAL
        : AppPages.HOME; // Jika token ada, arahkan ke home
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: getInitialRoute(),
      getPages: AppPages.routes,
    );
  }
}
