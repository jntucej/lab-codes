import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveUI(),
    );
  }
}

class ResponsiveUI extends StatelessWidget {
  const ResponsiveUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Responsive UI')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 800) {
            return const Center(child: Text('Desktop View', style: TextStyle(fontSize: 30)));
          } else if (constraints.maxWidth >= 600) {
            return const Center(child: Text('Tablet View', style: TextStyle(fontSize: 25)));
          } else {
            return const Center(child: Text('Mobile View', style: TextStyle(fontSize: 20)));
          }
        },
      ),
    );
  }
}
