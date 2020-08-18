// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  final _$emailAtom = Atom(name: '_LoginStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$autovalidateAtom = Atom(name: '_LoginStore.autovalidate');

  @override
  bool get autovalidate {
    _$autovalidateAtom.reportRead();
    return super.autovalidate;
  }

  @override
  set autovalidate(bool value) {
    _$autovalidateAtom.reportWrite(value, super.autovalidate, () {
      super.autovalidate = value;
    });
  }

  final _$onLoginAsyncAction = AsyncAction('_LoginStore.onLogin');

  @override
  Future<dynamic> onLogin(BuildContext context) {
    return _$onLoginAsyncAction.run(() => super.onLogin(context));
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  dynamic setAutovalidate({bool autovalidate}) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.setAutovalidate');
    try {
      return super.setAutovalidate(autovalidate: autovalidate);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChanged({String type, String value}) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.onChanged');
    try {
      return super.onChanged(type: type, value: value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
autovalidate: ${autovalidate}
    ''';
  }
}
