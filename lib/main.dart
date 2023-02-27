import 'package:flutter/material.dart';
import 'package:flutter_academy/pages/about_page.dart';
import 'package:flutter_academy/pages/contact_page.dart';
import 'package:flutter_academy/pages/courses_page.dart';
import 'package:flutter_academy/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (_) => const HomePage(),
        '/about': (_) => const AboutPage(),
        '/contact': (_) => const ContactPage(),
        '/courses': (_) => const CoursesPage(),
      },
    );
  }
}
