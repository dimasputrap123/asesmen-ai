import 'package:assesment/app/modules/survey/views/optionitem_view.dart';
import 'package:flutter/material.dart';

class OptionItem {
  final int id;
  final String label;
  OptionItem({required this.id, required this.label});
}

class FormMultipleOptionView extends StatefulWidget {
  final int id;
  final String question;
  final List<OptionItem> options;
  const FormMultipleOptionView(
      {super.key,
      required this.id,
      required this.question,
      required this.options});

  @override
  State<FormMultipleOptionView> createState() => FormMultipleOptionViewState();
}

class FormMultipleOptionViewState extends State<FormMultipleOptionView> {
  var _currentOption = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: widget.options.length,
            itemBuilder: (context, index) {
              var item = widget.options[index];
              return OptionitemView(
                  label: item.label,
                  currentId: _currentOption,
                  id: item.id,
                  onTap: (int id) {
                    setState(() {
                      _currentOption = id;
                    });
                  });
            },
          ),
        ),
      ],
    );
  }
}
