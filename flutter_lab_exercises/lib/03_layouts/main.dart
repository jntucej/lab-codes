import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Layouts'),
        ),
        body: Column(
          children: [
            const Text(
              'Row Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 50, height: 50, color: Colors.red),
                Container(width: 50, height: 50, color: Colors.green),
                Container(width: 50, height: 50, color: Colors.orange),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Column Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            Column(
              children: [
                Container(width: 100, height: 30, color: Colors.purple),
                const SizedBox(height: 10),
                Container(width: 100, height: 30, color: Colors.teal),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
