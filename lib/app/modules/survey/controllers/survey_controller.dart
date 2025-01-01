import 'package:get/get.dart';

class SurveyJawaban {
  int id;
  String jawaban;

  SurveyJawaban({required this.id, required this.jawaban});

  Map<String, dynamic> toJson() {
    return {'id_pertanyaan': id, 'jawaban': jawaban};
  }
}

class SurveyController extends GetxController {
  var currentSurveyForm = 0.obs;
  var listSurveyJawaban = <SurveyJawaban>[].obs;

  void changeSurveyForm(int id) => currentSurveyForm.value = id;

  void addSurveyJawaban(int id, String jawaban) {
    int index = listSurveyJawaban.indexWhere((e) => e.id == id);
    if (index == -1) {
      listSurveyJawaban.add(SurveyJawaban(id: id, jawaban: jawaban));
    } else {
      listSurveyJawaban[index].jawaban = jawaban;
    }
  }

  void editSurveyJawaban(int id, String jawaban) {
    int index = listSurveyJawaban.indexWhere((e) => e.id == id);
    if (index != -1) {
      listSurveyJawaban[index].jawaban = jawaban;
    }
  }
}
