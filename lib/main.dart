import 'package:flutter/material.dart';
import 'package:lpstest/soal_a/page_product.dart';
import 'package:lpstest/soal_b/number_converter.dart';
import 'package:lpstest/soal_c/character_count.dart';
import 'package:lpstest/soal_d/number_list.dart';
import 'package:lpstest/soal_e/text_format.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TEST LPS APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: "TEST LPS APP",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProductListScreen(),
                          )),
                      child: Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.amberAccent,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                            child: Text(
                          'SOAL A',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NumberConverter(),
                          )),
                      child: Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                            child: Text(
                          'SOAL B',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CharacterCount(),
                          )),
                      child: Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                            child: Text(
                          'SOAL C',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NumberList(),
                          )),
                      child: Container(
                        height: 200,
                        width: 200,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                            child: Text(
                          'SOAL D',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TextFormatScreen(),
                    )),
                child: Container(
                  height: 200,
                  width: 200,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                      child: Text(
                    'SOAL D',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
