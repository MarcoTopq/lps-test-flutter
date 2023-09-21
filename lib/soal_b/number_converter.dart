import 'package:flutter/material.dart';

class NumberConverter extends StatefulWidget {
  const NumberConverter({super.key});

  @override
  State<NumberConverter> createState() => _NumberConverterState();
}

class _NumberConverterState extends State<NumberConverter> {
  final TextEditingController _inputController = TextEditingController();
  final List<int> _outputList = [];

  void _convertNumber(String input) {
    _outputList.clear();
    input = input.replaceAll(".", "");

    if (input.isEmpty) {
      return;
    }

    int value = int.tryParse(input) ?? 0;
    String valueStr = value.toString();
    int length = valueStr.length;

    for (int i = 0; i < length; i++) {
      int digit = int.parse(valueStr[i]);
      int divisor = 1;
      for (int j = length - i - 1; j > 0; j--) {
        divisor *= 10;
      }
      int result = digit * divisor;
      if (result > 0) {
        _outputList.add(result);
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Number Converter',
        ),
        titleTextStyle: const TextStyle(color: Colors.black),
        backgroundColor: Colors.deepPurple.withOpacity(0.4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Input Number'),
              onChanged: (input) {
                _convertNumber(input);
              },
            ),
            const SizedBox(height: 20),
            Column(
              children: _outputList
                  .map((output) => Text(output.toString(),
                      style: const TextStyle(fontSize: 24)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
