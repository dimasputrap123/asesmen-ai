class RekapData {
  int? belum_asesmen;
  int? sudah_asesmen;
  int? tidak_ditemukan;
  int? meninggal;

  RekapData(
      {this.belum_asesmen,
      this.sudah_asesmen,
      this.tidak_ditemukan,
      this.meninggal});

  RekapData.fromJson(Map<String, dynamic> json) {
    belum_asesmen = json['belum_asesmen'];
    sudah_asesmen = json['sudah_asesmen'];
    tidak_ditemukan = json['tidak_ditemukan'];
    meninggal = json['meninggal'];
  }
}
