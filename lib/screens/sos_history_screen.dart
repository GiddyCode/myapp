import 'package:flutter/material.dart';

class SosHistoryScreen extends StatelessWidget {
  const SosHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SOS History')),
      body: ListView.builder(
        itemCount: 5, // Placeholder for SOS history
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.warning, color: Colors.red),
            title: Text('SOS Alert ${index + 1}'),
            subtitle: const Text('Date and Time'),
            onTap: () {
              // TODO: Show SOS details
            },
          );
        },
      ),
    );
  }
}
