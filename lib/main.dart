import 'package:ashtree/views/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'router.dart';

import 'counter.dart'; // Import the Counter

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [Provider<Counter>(create: (_) => Counter())],
        child: MaterialApp(
          initialRoute: '/',
          onGenerateRoute: Router.generateRoute,
        ));
  }
}
