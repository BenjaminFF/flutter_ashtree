import 'package:ashtree/assets/themes.dart';
import 'package:ashtree/router.dart';
import 'package:ashtree/services/web_api/api.dart';
import 'package:ashtree/services/web_api/http_util.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen();

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    onValidate();
  }

  Future onValidate() async {
    try {
      await Api().validate();
      await Navigator.pushNamedAndRemoveUntil(
          context, Router.homeRoute, (Route<dynamic> route) => false);
    } on DioError catch (e) {
      if (e.error is BusinessError) {
        if (e.error.code == 405) {
          await Navigator.pushNamedAndRemoveUntil(
              context, Router.loginRoute, (Route<dynamic> route) => false);
        }
      } else {      // 只要是DioError就跳转到homeRouter
        await Navigator.pushNamedAndRemoveUntil(
            context, Router.homeRoute, (Route<dynamic> route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center());
  }
}
