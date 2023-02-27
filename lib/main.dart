import 'package:flutter/material.dart';
import 'package:flutter_academy/pages/about_page.dart';
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
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) {
            switch (settings.name) {
              case '/':
                return HomePage();
              case '/about':
                return AboutPage();
              case '/contact':
                return ContactPage();
              case '/courses':
                return CoursesPage();
              default:
                final pathSegments = Uri.parse(settings.name!).pathSegments;
                print(pathSegments);
                if (pathSegments.length == 2 && pathSegments[0] == 'courses') {
                  final courseId = int.parse(pathSegments[1]);
                  return CourseDetailsPage(courseId: courseId);
                }
                return Error404Page();
            }
          },
          settings: settings,
        );
      },
    );
  }
}
