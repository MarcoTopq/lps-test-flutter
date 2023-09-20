import 'package:flutter/material.dart';
import 'package:lpstest/soal_a/product.dart';
import 'package:lpstest/soal_a/product_database.dart';

class EditProductScreen extends StatefulWidget {
  final Product product; // Produk yang akan diedit

  const EditProductScreen(this.product, {super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inisialisasi nilai teks field dengan data produk yang akan diedit
    _namaController.text = widget.product.namaBarang;
    _kodeController.text = widget.product.kodeBarang;
    _jumlahController.text = widget.product.jumlahBarang.toString();
  }

  void _updateProduct() async {
    final productName = _namaController.text;
    final productCode = _kodeController.text;
    final productQuantity = int.tryParse(_jumlahController.text) ?? 0;

    // Buat objek Product yang baru dengan data yang diperbarui
    final updatedProduct = widget.product.copyWith(
      namaBarang: productName,
      kodeBarang: productCode,
      jumlahBarang: productQuantity,
      tanggal: DateTime.now(),
    );

    // Panggil fungsi untuk mengupdate produk di database berdasarkan widget.product.id
    await ProductDatabase.instance.updateProduct(updatedProduct);

    // Kembali ke halaman sebelumnya
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Produk'),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _namaController,
              decoration: const InputDecoration(labelText: 'Nama Produk'),
            ),
            TextField(
              controller: _kodeController,
              decoration: const InputDecoration(labelText: 'Kode Produk'),
            ),
            TextField(
              controller: _jumlahController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Jumlah'),
            ),
            ElevatedButton(
              onPressed: _updateProduct,
              child: const Text('Simpan Perubahan'),
            ),
          ],
        ),
      ),
    );
  }
}
