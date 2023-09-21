import 'package:flutter/material.dart';

class NumberList extends StatefulWidget {
  const NumberList({super.key});

  @override
  State<NumberList> createState() => _NumberListState();
}

class _NumberListState extends State<NumberList> {
  int n = 30; // Default value for n

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengulangan Angka'),
        backgroundColor: Colors.deepPurple.withOpacity(0.4),
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukkan Nilai N',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  n = int.tryParse(value) ?? 0; // Parse input as an integer
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: n,
              itemBuilder: (context, index) {
                int number = index + 1;
                String text = number.toString();

                // Cek kelipatan 5 dan 6
                if (number % 5 == 0 && number != 5) {
                  text = 'IDIC';
                } else if (number % 6 == 0 && number != 6) {
                  text = 'LPS';
                }

                return ListTile(
                  title: Center(child: Text(text)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
