import 'package:flutter/material.dart';
import 'package:flutter_academy/scripts/load_courses.dart';

class LoadCourses extends StatelessWidget {
  const LoadCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Load'),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("Load Courses"),
            onPressed: () {
              loadCourses();
            },
          ),
        ));
  }
}
