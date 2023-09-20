import 'package:flutter/material.dart';
import 'package:lpstest/soal_a/product.dart';
import 'package:lpstest/soal_a/product_database.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();

  void _addProduct() async {
    final productName = _namaController.text;
    final productCode = _kodeController.text;
    final productQuantity = int.tryParse(_jumlahController.text) ?? 0;

    // Create a new Product instance
    final newProduct = Product(
      namaBarang: productName,
      kodeBarang: productCode,
      jumlahBarang: productQuantity,
      tanggal: DateTime.now(),
    );

    // Add the new product to the database
    await ProductDatabase.instance.addProduct(newProduct);

    // Close the AddProductScreen and return to the previous screen
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Produk'),
        titleTextStyle: const TextStyle(color: Colors.white),
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
              onPressed: _addProduct,
              child: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}
