import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PhoneNumberEntryScreen extends StatelessWidget {
  const PhoneNumberEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter Your Phone Number')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/otp'),
              child: const Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
