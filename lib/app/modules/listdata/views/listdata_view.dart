import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/listdata_controller.dart';

class AsesmenItem {
  final String nik;
  final String nama;
  final String alamat;

  const AsesmenItem(
      {required this.nik, required this.nama, required this.alamat});
}

class ListdataView extends GetView<ListdataController> {
  const ListdataView({super.key});

  // Widget cardList(List<String> listData) {
  //   return Card(
  //     margin: EdgeInsets.all(10),
  //     child: Column(
  //       children: [
  //         ListTile(
  //           title: Text('List ${listData[0]}'),
  //         ),
  //         Divider(),
  //         ListView.builder(
  //           itemCount: listData.length,
  //           shrinkWrap: true,
  //           physics: NeverScrollableScrollPhysics(),
  //           itemBuilder: (context, index) {
  //             return ListTile(
  //               title: Text(listData[index]),
  //             );
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }

  // Widget customGrid() {
  //   return GridView.builder(
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 2,
  //         // childAspectRatio: 2 / 2,
  //         crossAxisSpacing: 10,
  //         mainAxisSpacing: 10),
  //     itemCount: 8,
  //     padding: EdgeInsets.all(30),
  //     itemBuilder: (context, index) {
  //       return Container(
  //         decoration: BoxDecoration(
  //             color: Colors.green, borderRadius: BorderRadius.circular(13)),
  //         child: Center(
  //           child: Text("Hello word"),
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // List<List<String>> listsData = [
    //   ['Item 1', 'Item 2', 'Item 3'],
    //   ['Item A', 'Item B', 'Item C', 'Item D'],
    //   ['Item X', 'Item Y', 'Item Z'],
    //   ['Item P', 'Item Q', 'Item R'],
    //   ['Item M', 'Item N', 'Item O'],
    // ];

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
        itemBuilder: (context, index) {
          var item = listAsesmen[index];
          return Container(
            // margin: EdgeInsets.all(5),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2,color: Colors.grey.shade200)
              )
            ),
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nik,
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      item.nama,
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      item.alamat,
                      style: TextStyle(
                          fontSize: 16, overflow: TextOverflow.ellipsis),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
