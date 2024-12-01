import 'package:assesment/app/modules/survey/views/form_multiple_option_view.dart';
import 'package:assesment/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/survey_controller.dart';

class SurveyView extends GetView<SurveyController> {
  SurveyView({super.key});
  final PageController _pageController = PageController();

  final List<Widget> _forms = [
    FormMultipleOptionView(question: "Bagaimana kondisi rumah", options: [
      OptionItem(id: 0, label: "Permanen"),
      OptionItem(id: 1, label: "Semi Permanen"),
      OptionItem(id: 2, label: "Tidak Permanen")
    ]),
    FormMultipleOptionView(question: "Bagaimana sumber air minum", options: [
      OptionItem(id: 0, label: "PAM"),
      OptionItem(id: 1, label: "Sumur"),
      OptionItem(id: 2, label: "Sungai")
    ]),
    FormMultipleOptionView(question: "Apakah ada aset lain", options: [
      OptionItem(id: 0, label: "Ada"),
      OptionItem(id: 1, label: "Tidak Ada"),
    ]),
    FormMultipleOptionView(
        question: "Bagaimana status kepemilikan rumah",
        options: [
          OptionItem(id: 0, label: "Milik Sendiri"),
          OptionItem(id: 1, label: "Kontrak"),
          OptionItem(id: 2, label: "Sewa"),
        ]),
    FormMultipleOptionView(question: "Apa pekerjaan kepala keluarga", options: [
      OptionItem(id: 0, label: "Pegawai Swasta"),
      OptionItem(id: 1, label: "Pedagang Kecil"),
      OptionItem(id: 2, label: "Petani"),
      OptionItem(id: 3, label: "Buruh Harian Lepas"),
    ]),
    FormMultipleOptionView(question: "Apa sumber penerangan rumah", options: [
      OptionItem(id: 0, label: "PLN"),
      OptionItem(id: 1, label: "Listrik Non-PLN"),
      OptionItem(id: 2, label: "Tidak Ada"),
    ]),
    FormMultipleOptionView(
        question: "Apakah penghasilan dibawah UMP",
        options: [
          OptionItem(id: 1, label: "Ya"),
          OptionItem(id: 0, label: "Tidak"),
        ]),
    FormMultipleOptionView(
        question: "Apakah penghasilan dibawah UMP",
        options: [
          OptionItem(id: 1, label: "Ya"),
          OptionItem(id: 0, label: "Tidak"),
        ]),
    FormMultipleOptionView(
        question: "Apakah memiliki aset produktif",
        options: [
          OptionItem(id: 1, label: "Ya"),
          OptionItem(id: 0, label: "Tidak"),
        ]),
    FormMultipleOptionView(question: "Apakah pernah bersekolah", options: [
      OptionItem(id: 1, label: "Ya"),
      OptionItem(id: 0, label: "Tidak"),
    ]),
    FormMultipleOptionView(
        question: "Apakah memiliki asuransi kesehatan",
        options: [
          OptionItem(id: 1, label: "Ya"),
          OptionItem(id: 0, label: "Tidak"),
        ]),
    FormMultipleOptionView(question: "Apakah listrik 450 VA", options: [
      OptionItem(id: 1, label: "Ya"),
      OptionItem(id: 0, label: "Tidak"),
    ]),
    FormMultipleOptionView(question: "Apakah rumah layak huni", options: [
      OptionItem(id: 1, label: "Ya"),
      OptionItem(id: 0, label: "Tidak"),
    ]),
  ];

  void _nextForm() {
    if (controller.currentSurveyForm.value >= _forms.length - 1) {
      return;
    }
    var currentForm = controller.currentSurveyForm.value + 1;
    controller.currentSurveyForm(currentForm);
    _pageController.animateToPage(
      currentForm,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _prevForm() {
    if (controller.currentSurveyForm.value == 0) {
      return;
    }
    var currentForm = controller.currentSurveyForm.value - 1;
    controller.currentSurveyForm(currentForm);
    _pageController.animateToPage(
      currentForm,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
              '${controller.currentSurveyForm.value + 1} dari ${_forms.length}',
              style: TextStyle(fontSize: 16),
            )),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 15, left: 15, right: 15),
          child: Column(
            children: [
              Obx(() => LinearProgressIndicator(
                    value: (controller.currentSurveyForm.value + 1) /
                        _forms.length,
                    color: progressBar,
                  )),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  children: _forms,
                ),
              ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      controller.currentSurveyForm.value > 0
                          ? Expanded(
                              child: TextButton(
                                  onPressed: _prevForm,
                                  child: Text(
                                    "Kembali",
                                    style: TextStyle(
                                        color: selectedText,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600),
                                  )),
                            )
                          : SizedBox(),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: _nextForm,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: filledButton,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text(
                              "Selanjutnya",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
