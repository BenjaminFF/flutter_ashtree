import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ashtree/views/login/login_screen.dart';
import 'package:ashtree/views/home/home_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/login':
        return MaterialPageRoute(
            builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
