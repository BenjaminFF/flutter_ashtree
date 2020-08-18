import 'package:ashtree/views/learn/learn_screen.dart';
import 'package:ashtree/views/login/login_screen.dart';
import 'package:ashtree/views/home/home_screen.dart';
import 'package:ashtree/views/splash/splash_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LearnScreenArguments {
  final int sid;
  final String origin_id;

  LearnScreenArguments(this.sid, this.origin_id);
}

class Router {
  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String learnRoute = '/learn';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return createRoute(SplashScreen());
      case homeRoute:
        return createRoute(HomeScreen());
      case loginRoute:
        return createRoute(LoginScreen());
      case learnRoute:
        final LearnScreenArguments args = settings.arguments;
        return createRoute(
            LearnScreen(sid: args.sid, origin_id: args.origin_id));
      default:
        return createRoute(HomeScreen());
    }
  }

  static Route createRoute(Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
