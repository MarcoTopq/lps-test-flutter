class Product {
  int? id;
  String namaBarang;
  String kodeBarang;
  int jumlahBarang;
  DateTime tanggal;

  Product({
     this.id,
    required this.namaBarang,
    required this.kodeBarang,
    required this.jumlahBarang,
    required this.tanggal,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama_barang': namaBarang,
      'kode_barang': kodeBarang,
      'jumlah_barang': jumlahBarang,
      'tanggal': tanggal.toIso8601String(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      namaBarang: map['nama_barang'],
      kodeBarang: map['kode_barang'],
      jumlahBarang: map['jumlah_barang'],
      tanggal: DateTime.parse(map['tanggal']),
    );
  }
  Product copyWith({
    int? id,
    String? namaBarang,
    String? kodeBarang,
    int? jumlahBarang,
    DateTime? tanggal,
  }) {
    return Product(
      id: id ?? this.id,
      namaBarang: namaBarang ?? this.namaBarang,
      kodeBarang: kodeBarang ?? this.kodeBarang,
      jumlahBarang: jumlahBarang ?? this.jumlahBarang,
      tanggal: tanggal ?? this.tanggal,
    );
  }
}
