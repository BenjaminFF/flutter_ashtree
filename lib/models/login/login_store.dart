import 'package:ashtree/router.dart';
import 'package:ashtree/services/local_storage/shared_preferances_service.dart';
import 'package:ashtree/services/web_api/api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:random_string/random_string.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email = '', password = '';
  @observable
  bool autovalidate = false;

  @action
  Future onLogin(BuildContext context) async {
    var res = await Api().login(DateTime.now().millisecondsSinceEpoch,
        randomString(12), email, password);
    String uid = res['data']['uid'], token = res['data']['token'];
    String session = "uid=$uid;$uid=$token";
    await SharedPreferanceService().setSession(session);
    await Navigator.pushNamedAndRemoveUntil(
        context, Router.homeRoute, (Route<dynamic> route) => false);
  }

  @action
  setAutovalidate({bool autovalidate}) {
    this.autovalidate = autovalidate;
  }

  @action
  void onChanged({String type, String value}) {
    if (type == 'email') {
      email = value;
    } else {
      password = value;
    }
  }
}
