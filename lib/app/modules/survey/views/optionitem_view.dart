import 'package:assesment/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionitemView extends StatelessWidget {
  final String label;
  final int id;
  final int currentId;
  final Function(int) onTap;
  const OptionitemView(
      {super.key,
      required this.label,
      required this.currentId,
      required this.id,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    var isSelected = currentId == id;
    return GestureDetector(
      onTap: () {
        onTap(id);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? selectedTab : Colors.black45,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(color: isSelected ? selectedText : Colors.black),
            ),
            isSelected
                ? Icon(
                    Icons.check_circle_outline,
                    color: selectedText,
                    size: 20,
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
