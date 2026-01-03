
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50),
          ),
          const SizedBox(height: 10),
          const Text(
            'John Doe',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'john.doe@example.com',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('SOS History'),
            onTap: () => context.go('/sos-history'),
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text('Trusted Contacts'),
            onTap: () => context.go('/trusted-contacts'),
          ),
          ListTile(
            leading: const Icon(Icons.shield_outlined),
            title: const Text('Emergency Settings'),
            onTap: () => context.go('/emergency-settings'),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => context.go('/settings'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            onTap: () {
              // TODO: Implement logout functionality
              context.go('/');
            },
          ),
        ],
      ),
    );
  }
}
