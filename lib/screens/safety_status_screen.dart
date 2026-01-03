import 'package:flutter/material.dart';

class SafetyStatusScreen extends StatelessWidget {
  const SafetyStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Safety Status')),
      body: const Center(child: Text('Safety Status Screen')),
    );
  }
}
