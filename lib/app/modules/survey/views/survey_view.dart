import 'package:assesment/app/modules/survey/views/form_input_view.dart';
import 'package:assesment/app/modules/survey/views/form_multiple_option_view.dart';
import 'package:assesment/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/survey_controller.dart';

class SurveyView extends GetView<SurveyController> {
  SurveyView({super.key});
  final List<GlobalKey<dynamic>> _childKeys = [
    GlobalKey<FormInputViewState>(),
    GlobalKey<FormInputViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
    GlobalKey<FormMultipleOptionViewState>(),
  ];
  final PageController _pageController = PageController();

  late final List<Widget> _forms = [
    FormInputView(
        key: _childKeys[0], id: 1, question: "Jumlah anggota keluarga"),
    FormInputView(
        key: _childKeys[1],
        id: 2,
        question: "Jumlah pendapatan pengurus keluarga"),
    FormMultipleOptionView(
        key: _childKeys[2],
        id: 3,
        question: "Bagaimana kondisi rumah",
        options: [
          OptionItem(id: "Permanen", label: "Permanen"),
          OptionItem(id: "Semi Permanen", label: "Semi Permanen"),
          OptionItem(id: "Tidak Permanen", label: "Tidak Permanen")
        ]),
    FormMultipleOptionView(
        key: _childKeys[3],
        id: 4,
        question: "Bagaimana sumber air minum",
        options: [
          OptionItem(id: "PAM", label: "PAM"),
          OptionItem(id: "Sumur", label: "Sumur"),
          OptionItem(id: "Sungai", label: "Sungai")
        ]),
    FormMultipleOptionView(
        key: _childKeys[4],
        id: 5,
        question: "Apa sumber penerangan rumah",
        options: [
          OptionItem(id: "PLN", label: "PLN"),
          OptionItem(id: "Listrik Non-PLN", label: "Listrik Non-PLN"),
          OptionItem(id: "Tidak Ada", label: "Tidak Ada"),
        ]),
    FormMultipleOptionView(
        key: _childKeys[5],
        id: 6,
        question: "Apakah ada aset lain",
        options: [
          OptionItem(id: "Ada", label: "Ada"),
          OptionItem(id: "Tidak Ada", label: "Tidak Ada"),
        ]),
    FormMultipleOptionView(
        key: _childKeys[6],
        id: 7,
        question: "Apa pekerjaan kepala keluarga",
        options: [
          OptionItem(id: "Pegawai Swasta", label: "Pegawai Swasta"),
          OptionItem(id: "Pedagang Kecil", label: "Pedagang Kecil"),
          OptionItem(id: "Petani", label: "Petani"),
          OptionItem(id: "Buruh Harian Lepas", label: "Buruh Harian Lepas"),
        ]),
    FormMultipleOptionView(
        key: _childKeys[7],
        id: 8,
        question: "Bagaimana status kepemilikan rumah",
        options: [
          OptionItem(id: "Milik Sendiri", label: "Milik Sendiri"),
          OptionItem(id: "Kontrak", label: "Kontrak"),
          OptionItem(id: "Sewa", label: "Sewa"),
        ]),
    FormMultipleOptionView(
        key: _childKeys[8],
        id: 9,
        question: "Apakah penghasilan dibawah UMP",
        options: [
          OptionItem(id: "1", label: "Ya"),
          OptionItem(id: "0", label: "Tidak"),
        ]),
    FormMultipleOptionView(
        key: _childKeys[9],
        id: 10,
        question: "Apakah memiliki aset produktif",
        options: [
          OptionItem(id: "1", label: "Ya"),
          OptionItem(id: "0", label: "Tidak"),
        ]),
    FormMultipleOptionView(
        key: _childKeys[10],
        id: 11,
        question: "Apakah pernah bersekolah",
        options: [
          OptionItem(id: "1", label: "Ya"),
          OptionItem(id: "0", label: "Tidak"),
        ]),
    FormMultipleOptionView(
        key: _childKeys[11],
        id: 12,
        question: "Apakah memiliki asuransi kesehatan",
        options: [
          OptionItem(id: "1", label: "Ya"),
          OptionItem(id: "0", label: "Tidak"),
        ]),
    FormMultipleOptionView(
        key: _childKeys[12],
        id: 13,
        question: "Apakah memiliki wc di dalam rumah",
        options: [
          OptionItem(id: "1", label: "Ya"),
          OptionItem(id: "0", label: "Tidak"),
        ]),
    FormMultipleOptionView(
        key: _childKeys[13],
        id: 14,
        question: "Apakah sumber penerangan dari PLN",
        options: [
          OptionItem(id: "1", label: "Ya"),
          OptionItem(id: "0", label: "Tidak"),
        ]),
    FormMultipleOptionView(
        key: _childKeys[14],
        id: 15,
        question: "Apakah rumah layak huni",
        options: [
          OptionItem(id: "1", label: "Ya"),
          OptionItem(id: "0", label: "Tidak"),
        ]),
  ];

  void _nextForm() {
    if (controller.currentSurveyForm.value > _forms.length - 1) {
      return;
    }

    var result = _childKeys[controller.currentSurveyForm.value]
        .currentState
        ?.getInputValue();
    if (result != null) {
      controller.addSurveyJawaban(result['id'], result['value']);
    }
    var currentForm = controller.currentSurveyForm.value + 1;
    controller.currentSurveyForm(currentForm);

    if (controller.currentSurveyForm.value <= _forms.length - 1) {
      _pageController.animateToPage(
        currentForm,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      int id = Get.arguments ?? 0;
      Get.toNamed('/result', arguments: id);
    }
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
