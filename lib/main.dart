import 'package:flutter/material.dart';
import 'package:flutter_academy/app/routes/app_route_parser.router.dart';
import 'package:flutter_academy/app/routes/router_delegate.router.dart';

void main() {
  runApp(const MyApp());
}

final routerDelegate = AppRouterDelegate();
final _routeParser = AppRouteInformationParser();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerDelegate: routerDelegate,
      routeInformationParser: _routeParser,
    );
  }
}
