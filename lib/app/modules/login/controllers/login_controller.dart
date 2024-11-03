import 'package:get/get.dart';

class LoginController extends GetxController {
  var obscure = true.obs;

  void obscureToggle() => obscure.value = !obscure.value;
}
