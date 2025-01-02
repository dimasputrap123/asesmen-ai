import 'package:get/get.dart';

import '../controllers/save_result_controller.dart';

class SaveResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SaveResultController>(
      () => SaveResultController(),
    );
  }
}
