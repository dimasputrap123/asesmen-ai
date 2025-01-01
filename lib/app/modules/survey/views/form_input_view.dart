import 'package:flutter/material.dart';

class FormInputView extends StatefulWidget {
  final int id;
  final String question;
  const FormInputView({super.key, required this.id, required this.question});

  @override
  State<FormInputView> createState() => FormInputViewState();
}

class FormInputViewState extends State<FormInputView> {
  final _formKey = GlobalKey<FormState>();
  final inputController = TextEditingController();

  Map<String, dynamic> getInputValue() {
    return {'id': widget.id, 'value': inputController.text};
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.question,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Form(
            key: _formKey,
            child: TextFormField(
              controller: inputController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(),
                    borderRadius: BorderRadius.circular(10)),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF1bae9f)),
                    borderRadius: BorderRadius.circular(10)),
                hintText: "Jawaban",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Harus diisi!";
                }
                return null;
              },
            ))
      ],
    );
  }
}
