class KpmData {
  int? id;
  String? nik;
  String? nama;
  String? alamat;
  int? status;

  KpmData({this.id, this.nik, this.nama, this.alamat, this.status});

  KpmData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    nama = json['nama'];
    alamat = json['alamat'];
    status = json['status'];
  }
}
