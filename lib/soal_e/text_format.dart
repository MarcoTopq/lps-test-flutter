import 'package:flutter/material.dart';

class TextFormatScreen extends StatefulWidget {
  const TextFormatScreen({super.key});

  @override
  State<TextFormatScreen> createState() => _TextFormatScreenState();
}

class _TextFormatScreenState extends State<TextFormatScreen> {
  String inputText = '';
  String titleFormat = '';
  String normalFormat = '';

  void formatText() {
    String formattedText = inputText.trim();

    // Format judul (title case)
    titleFormat = formattedText
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');

    // Format biasa (lowercase)
    normalFormat = formattedText.toLowerCase();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Format'),
        backgroundColor: Colors.deepPurple.withOpacity(0.4),
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (text) {
                inputText = text;
              },
              decoration: const InputDecoration(labelText: 'Masukkan teks'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: formatText,
              child: const Text('Format Teks'),
            ),
            const SizedBox(height: 16),
            Text(
              'Format Judul: $titleFormat',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              'Format Biasa: $normalFormat',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
