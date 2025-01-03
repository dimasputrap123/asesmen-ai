import 'package:assesment/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/save_result_controller.dart';

class SaveResultView extends GetView<SaveResultController> {
  const SaveResultView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.check_circle,
                  size: 100,
                  color: filledButton,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Survey berhasil disimpan",
                  style: TextStyle(fontSize: 25),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed('/home');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    backgroundColor: Color(0xFF1bae9f),
                  ),
                  child: Text(
                    "Kembali",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
