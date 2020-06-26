import 'package:ashtree/services/local_storage/shared_preferances_service.dart';
import 'package:ashtree/services/web_api/api.dart';
import 'package:ashtree/services/web_api/http_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router.dart';

import 'counter.dart'; // Import the Counter

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRouter = '/';
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    onValidate();
  }

  Future onValidate() async {
    try {
      await Api().validate();
    } on DioError catch (e) {
      if (e.error is BusinessError) {
        if (e.error.code == 405) {
          setState(() {
            initialRouter = '/login';
          });
        }
      }
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<Counter>(create: (_) => Counter())],
      child: !isLoading
          ? MaterialApp(
              initialRoute: initialRouter,
              onGenerateRoute: Router.generateRoute,
            )
          : Center(
              child: Text(
                'loading',
                textDirection: TextDirection.ltr,
              ),
            ),
    );
  }
}
