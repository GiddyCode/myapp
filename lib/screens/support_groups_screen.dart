import 'package:flutter/material.dart';

class SupportGroupsScreen extends StatelessWidget {
  const SupportGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Support Groups')),
      body: ListView.builder(
        itemCount: 5, // Placeholder for support groups
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListTile(
              leading: const Icon(Icons.group_work, size: 40),
              title: Text('Support Group ${index + 1}'),
              subtitle: const Text('A safe space for sharing and healing.'),
              trailing: ElevatedButton(
                onPressed: () {
                  // TODO: Implement join group functionality
                },
                child: const Text('Join'),
              ),
            ),
          );
        },
      ),
    );
  }
}
