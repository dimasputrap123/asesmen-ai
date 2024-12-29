import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsesmenItem {
  final int id;
  final String nik;
  final String nama;
  final String alamat;

  const AsesmenItem(
      {required this.id,
      required this.nik,
      required this.nama,
      required this.alamat});
}

class ListcardView extends GetView {
  final AsesmenItem item;
  final Function(int)? onTap;
  const ListcardView({super.key, required this.item, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!(item.id);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 2, color: Colors.grey.shade200))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.co_present_sharp,
              size: 45,
              color: Color(0xFF1bae9f),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.nik,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.nama,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    item.alamat,
                    softWrap: true,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
