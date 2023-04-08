import 'package:flutter/material.dart';
import 'package:flutter_academy/app/views/login.view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LoginView()),
    );
  }
}
