import 'package:flutter/material.dart';
import 'package:flutter_academy/main.dart';

class Error404Page extends StatelessWidget {
  const Error404Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text('404'),
            ElevatedButton(
              child: const Text('Go to Home'),
              onPressed: () {
                routerDelegate.go('/');
              },
            )
          ],
        ),
      ),
    );
  }
}
