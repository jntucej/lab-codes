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
      home: ResponsivePage(),
    );
  }
}

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return const MobileView();
    } else if (width < 900) {
      return const TabletView();
    } else {
      return const DesktopView();
    }
  }
}

class MobileView extends StatelessWidget {
  const MobileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile View')),
      body: const Center(child: Text('This is Mobile Screen', style: TextStyle(fontSize: 20))),
    );
  }
}

class TabletView extends StatelessWidget {
  const TabletView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tablet View')),
      body: const Center(child: Text('This is Tablet Screen', style: TextStyle(fontSize: 25))),
    );
  }
}

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Desktop View')),
      body: const Center(child: Text('This is Desktop Screen', style: TextStyle(fontSize: 30))),
    );
  }
}
