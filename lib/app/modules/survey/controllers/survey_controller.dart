import 'package:get/get.dart';

class SurveyController extends GetxController {
  var currentSurveyForm = 0.obs;

  void changeSurveyForm(int id) => currentSurveyForm.value = id;
}
