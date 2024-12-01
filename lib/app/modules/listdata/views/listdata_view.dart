import 'package:assesment/app/modules/listdata/views/listcard_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/listdata_controller.dart';

class ListdataView extends GetView<ListdataController> {
  const ListdataView({super.key});

  @override
  Widget build(BuildContext context) {
    List<AsesmenItem> listAsesmen = [
      AsesmenItem(
          nik: '3125123421234512',
          nama: 'Slamet',
          alamat: 'Kec. A, Kel. B Jl. addr No 19'),
      AsesmenItem(
          nik: '3125612345123461',
          nama: 'Budi',
          alamat: 'Kec. C, Kel. D Jl. addr No 20'),
      AsesmenItem(
          nik: '3129482738412847',
          nama: 'Budi',
          alamat: 'Kec. E, Kel. F Jl. addr No 20'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prelist Asesmen'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listAsesmen.length,
        itemBuilder: (context, index) => ListcardView(item: listAsesmen[index],onTap: (){
          print("tes123");
          Get.toNamed("/survey");
        },),
      ),
    );
  }
}
