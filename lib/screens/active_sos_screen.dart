import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActiveSosScreen extends StatelessWidget {
  const ActiveSosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.warning, size: 100, color: Colors.white),
            const SizedBox(height: 20),
            Text(
              'SOS ACTIVATED',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Your trusted contacts have been notified.',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => context.go('/home'),
              child: const Text('End SOS'),
            ),
          ],
        ),
      ),
    );
  }
}
