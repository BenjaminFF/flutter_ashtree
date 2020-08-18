import 'package:ashtree/assets/themes.dart';
import 'package:ashtree/services/local_storage/shared_preferances_service.dart';
import 'package:ashtree/services/web_api/api.dart';
import 'package:ashtree/services/web_api/http_util.dart';
import 'package:ashtree/views/splash/splash_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'router.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     // Provider<Counter>(create: (_) => Counter())
    //   ],
    //   child: !isLoading
    //       ? MaterialApp(
    //           initialRoute: initialRouter,
    //           onGenerateRoute: Router.generateRoute,
    //           theme: lightTheme,
    //         )
    //       : Center(
    //           child: Text(
    //             'loading',
    //             textDirection: TextDirection.ltr,
    //           ),
    //         ),
    // );

    return MaterialApp(
      initialRoute: Router.splashRoute,
      onGenerateRoute: Router.generateRoute,
      theme: lightTheme,
    );
  }
}
