import 'package:flutter/material.dart';
import 'package:integratingmaps/app_routes.dart';
import 'package:integratingmaps/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Maps',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: AppRoutes.location,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
