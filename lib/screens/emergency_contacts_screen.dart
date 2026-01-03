
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({super.key});

  @override
  State<EmergencyContactsScreen> createState() => _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  final List<String> _emergencyContacts = [];

  void _addEmergencyContact() {
    // TODO: Implement contact picker
    setState(() {
      _emergencyContacts.add('New Contact');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addEmergencyContact,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _emergencyContacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_emergencyContacts[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  _emergencyContacts.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/home'),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
