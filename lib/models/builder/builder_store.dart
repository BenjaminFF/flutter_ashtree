import 'dart:math';

import 'package:ashtree/services/utils/util_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
import 'package:ashtree/services/web_api/api.dart';

part 'builder_store.g.dart';

class BuilderStore = _BuilderStore with _$BuilderStore;

abstract class _BuilderStore with Store {
  @observable
  String name = '', description = '';
  @observable
  List<Map> terms;
  @observable
  int minTermCount = 3;
  @observable
  int curFocusIndex = 2;

  @action
  Future onInit() async {
    terms = new List();
    for (int i = 0; i < minTermCount; i++) {
      terms.add({
        'id': UniqueKey(),
        'term': '',
        'definition': '',
        'termFocus': FocusNode(),
        'defFocus': FocusNode()
      });
    }
  }

  @action
  insertItem(index) {
    terms.insert(index, {
      'id': UniqueKey(),
      'term': '',
      'definition': '',
      'termFocus': FocusNode(),
      'defFocus': FocusNode(),
    });
  }

  @action
  removeItem(index) {
    terms.removeAt(index);
  }

  @action
  onValueChange(String type, int index, String value) {
    terms[index][type] = value;
  }

  @action
  onValidate() {
    for (int i = 0; i < terms.length; i++) {
      if (terms[i]['term'] == '') {
        terms[i]['termFocus'].requestFocus();
        Fluttertoast.showMToast(
          msg: '请输入定义',
          toastType: ToastType.ERROR,
        );
        return;
      }
      if (terms[i]['definition'] == '') {
        terms[i]['defFocus'].requestFocus();
        Fluttertoast.showMToast(
          msg: '请输入解释',
          toastType: ToastType.ERROR,
        );
        return;
      }
    }
  }

  @action
  disposeFocus() {
    for (int i = 0; i < terms.length; i++) {
      terms[i]['termFocus'].dispose();
      terms[i]['defFocus'].dispose();
    }
  }
}
