import 'package:flutter/material.dart';
import 'package:flutter_academy/widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          AppBar(
            title: const Text('Flutter Academy'),
          ),
          const Header(),
        ],
      ),
    );
  }
}
