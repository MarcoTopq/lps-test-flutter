import 'package:flutter/material.dart';
import 'package:lpstest/soal_a/add_product.dart';
import 'package:lpstest/soal_a/product.dart';
import 'package:lpstest/soal_a/product_database.dart';
import 'package:lpstest/soal_a/update_product.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    _getProducts();
  }

  Future<void> _getProducts() async {
    final productList = await ProductDatabase.instance.getAllProducts();
    setState(() {
      products = productList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        titleTextStyle: const TextStyle(color: Colors.black),
        backgroundColor: Colors.deepPurple.withOpacity(0.4),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: Text(product.namaBarang),
              subtitle: Text(
                  'Kode: ${product.kodeBarang}, Jumlah: ${product.jumlahBarang}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    color: Colors.blueAccent,
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProductScreen(product),
                        ),
                      ).then((_) => _getProducts());
                    },
                  ),
                  IconButton(
                    color: Colors.red,
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _deleteProduct(product.id!);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddProductScreen(),
            ),
          ).then((_) => _getProducts());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _deleteProduct(int productId) async {
    await ProductDatabase.instance.deleteProduct(productId);
    _getProducts();
  }
}
