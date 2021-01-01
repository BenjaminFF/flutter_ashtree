import 'dart:math';

import 'package:ashtree/services/utils/util_service.dart';
import 'package:flutter/material.dart';
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

  @action
  Future onInit() async {
    terms = new List();
    for (int i = 0; i < minTermCount; i++) {
      terms.add({'id': UniqueKey(), 'term': i.toString(), 'definition': ''});
    }
  }

  @action
  insertItem(index) {
    terms.insert(index, {'id': UniqueKey(), 'term': '', 'definition': ''});
  }

  @action
  removeItem(index) {
    terms.removeAt(index);
  }

  @action
  onValueChange(String type, int index, String value) {
    terms[index][type] = value;
  }
}
