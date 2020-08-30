import 'package:ashtree/models/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_field_validator/form_field_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen();

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _loginStore = LoginStore();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  renderTitle() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 64, bottom: 32),
      child: Text(
        'EWORDFUN',
        style: Theme.of(context).textTheme.headline1,
        textAlign: TextAlign.center,
      ),
    );
  }

  renderForm() {
    return Observer(
      builder: (_) => Form(
        key: _formKey,
        autovalidate: _loginStore.autovalidate,
        child: Column(
          children: [
            renderInput(type: 'email'),
            renderInput(type: 'password'),
            renderLoginButton(),
          ],
        ),
      ),
    );
  }

  renderInput({String type}) {
    String hintText;
    bool obscureText;
    MultiValidator validator;
    if (type == 'email') {
      hintText = '邮箱';
      obscureText = false;
      validator = MultiValidator([
        RequiredValidator(errorText: '请输入邮箱'),
        EmailValidator(errorText: '请输入正确的邮箱')
      ]);
    } else {
      hintText = '密码';
      obscureText = true;
      validator = MultiValidator([
        RequiredValidator(errorText: '请输入密码'),
      ]);
    }
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
      child: TextFormField(
        maxLength: 30,
        maxLines: 1,
        obscureText: obscureText,
        style: Theme.of(context).textTheme.bodyText2,
        validator: validator,
        onChanged: (String value) {
          _loginStore.onChanged(type: type, value: value);
        },
        decoration: InputDecoration(
          helperText: '',
          counterText: '',
          hintText: hintText,
        ),
      ),
    );
  }

  renderLoginButton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
      child: RaisedButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/home');
          if (_formKey.currentState.validate()) _loginStore.onLogin(context);
          if (!_loginStore.autovalidate)
            _loginStore.setAutovalidate(autovalidate: true);
        },
        child: Text(
          '登陆',
          style: TextStyle(fontSize: 16.0, letterSpacing: 12.0),
        ),
        splashColor: Theme.of(context).primaryColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }

  renderLoginFunc() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            renderTitle(),
            renderForm(),
          ],
        ),
      ),
    );
  }
}
