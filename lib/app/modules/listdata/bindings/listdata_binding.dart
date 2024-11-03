import 'package:get/get.dart';

import '../controllers/listdata_controller.dart';

class ListdataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListdataController>(
      () => ListdataController(),
    );
  }
}
