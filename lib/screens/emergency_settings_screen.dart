import 'package:flutter/material.dart';

class EmergencySettingsScreen extends StatelessWidget {
  const EmergencySettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Emergency Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Enable Silent SOS'),
            subtitle: const Text(
              'Activate SOS without any sound or notification',
            ),
            value: false,
            onChanged: (value) {
              // TODO: Implement setting change
            },
          ),
          SwitchListTile(
            title: const Text('Share Live Location'),
            subtitle: const Text(
              'Automatically share your live location with trusted contacts during an SOS',
            ),
            value: true,
            onChanged: (value) {
              // TODO: Implement setting change
            },
          ),
          ListTile(
            title: const Text('Customize SOS Message'),
            subtitle: const Text(
              'Personalize the message sent to your trusted contacts',
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // TODO: Navigate to customize message screen
            },
          ),
        ],
      ),
    );
  }
}
