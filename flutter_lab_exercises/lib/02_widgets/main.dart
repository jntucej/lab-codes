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
          title: const Text('Explore Flutter Widgets'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Text Widget',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Container(
                width: 200,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Container Widget',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                width: 200,
                height: 150,
              ),
              const SizedBox(height: 16),
              const Icon(
                Icons.flutter_dash,
                size: 60,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
