import 'package:flutter/material.dart';
import 'package:integratingmaps/constant.dart';
import 'package:integratingmaps/home_screen.dart';
import 'package:integratingmaps/location_screen.dart';

class AppRoutes {
  static const String home = '/home';
  static const String location = '/location';
  // Add other route names here
}

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.location:
        return MaterialPageRoute(builder: (_) => const LocationScreen());
      // Add cases for other screens/routes
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
          backgroundColor: rPrimaryColor,
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
