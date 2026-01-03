import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SosActivationScreen extends StatefulWidget {
  const SosActivationScreen({super.key});

  @override
  State<SosActivationScreen> createState() => _SosActivationScreenState();
}

class _SosActivationScreenState extends State<SosActivationScreen> {
  int _countdown = 5;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer?.cancel();
          // TODO: Implement SOS activation logic
          context.go('/active-sos');
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SOS in',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(color: Colors.white),
            ),
            Text(
              '$_countdown',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                _timer?.cancel();
                context.go('/home');
              },
              child: const Text('Cancel'),
            ),
          ],
        ),
      ),
    );
  }
}
