class DataKuliner {
  final List<WisatakulinerModel> data;
  DataKuliner({
    required this.data,
  });
  factory DataKuliner.formJson(Map<String, dynamic> json) => DataKuliner(
      data: List.from(json['data'].map((user) => WisatakulinerModel.formModel(user))));
}

class WisatakulinerModel {
  final int no;
  final String fotoUrl;
  final String nama;
  final String alamat;
  final String pemilik;

  WisatakulinerModel({
    required this.no,
    required this.fotoUrl,
    required this.nama,
    required this.alamat,
    required this.pemilik,
  });

  factory WisatakulinerModel.formModel(Map<String, dynamic> json) =>
      WisatakulinerModel(
        no: json["no"],
        fotoUrl: json["foto_url"],
        nama: json["nama"],
        alamat: json["alamat"],
        pemilik: json["pemilik"],
      );
}
