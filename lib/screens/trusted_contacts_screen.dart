
import 'package:flutter/material.dart';

class TrustedContactsScreen extends StatelessWidget {
  const TrustedContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trusted Contacts')),
      body: ListView.builder(
        itemCount: 3, // Placeholder for trusted contacts
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text('Contact Name ${index + 1}'),
            subtitle: const Text('Relationship'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // TODO: Implement delete contact functionality
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add contact functionality
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
