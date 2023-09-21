import 'package:flutter/material.dart';

class CharacterCount extends StatefulWidget {
  const CharacterCount({super.key});

  @override
  State<CharacterCount> createState() => _CharacterCountState();
}

class _CharacterCountState extends State<CharacterCount> {
  final TextEditingController _inputController = TextEditingController();
  final Map<String, int> _characterCountMap = {};

  Map<String, int> _countCharacters(String input) {
    _characterCountMap.clear();

    for (int i = 0; i < input.length; i++) {
      if (input[i] != ' ') {
        final char = input[i];
        if (_characterCountMap.containsKey(char)) {
          _characterCountMap[char] = _characterCountMap[char]! + 1;
        } else {
          _characterCountMap[char] = 1;
        }
      }
    }
    setState(() {});
    return _characterCountMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Character Count'),
        backgroundColor: Colors.deepPurple.withOpacity(0.4),
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(labelText: 'Input String'),
              onChanged: (input) {
                _countCharacters(input);
                setState(() {});
              },
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _characterCountMap.entries.map((entry) {
                return Text('${entry.key} - ${entry.value}');
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
