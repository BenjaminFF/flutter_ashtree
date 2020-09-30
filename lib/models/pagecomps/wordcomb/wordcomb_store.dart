import 'package:ashtree/components/button/button_comp.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:mobx/mobx.dart';
import 'package:ashtree/services/utils/util_service.dart';

part 'wordcomb_store.g.dart';

class WordCombStore = _WordCombStore with _$WordCombStore;

abstract class _WordCombStore with Store {
  @observable
  ObservableList usArr, sgArr; //underScore Arr, squireGrid Arr
  @observable
  int status = 0; // 0:normal  1:success  2:error
  @observable
  String answer = '', curAnswer = '', isSpace = '#~~isSpace~~#';
  @observable
  int curIndex = 0;

  @action
  onInit(String term, String definition, int row) {
    this.answer = term;
    usArr = ObservableList();
    sgArr = ObservableList();
    List<String> termArr = term.split(RegExp('\\s+')), tempArr = List<String>();

    while (true) {
      termArr.asMap().forEach((index, term) {
        tempArr = List.from(tempArr)
          ..addAll(UtilService().splitStr(term, row * row ~/ termArr.length));
        if (index != termArr.length - 1) {
          tempArr.add(isSpace);
        }
      });
      if ((tempArr.length - termArr.length) < row * row) break;
    }

    tempArr.forEach((subStr) {
      usArr.add({'text': "", 'isSpace': subStr == isSpace});
      if (subStr != isSpace) sgArr.add({'active': false, 'text': subStr});
    });

    while (sgArr.length < row * row) {
      sgArr.add({
        'active': false,
        'text': UtilService()
            .mixStr(tempArr[(Random().nextDouble() * termArr.length).toInt()])
      });
    }
    sgArr.shuffle();
  }

  @action
  getButtonType(index) {
    if (!sgArr[index]['active']) {
      return ButtonType.Plain;
    }

    switch (status) {
      case 0:
        return ButtonType.Active;
      case 1:
        return ButtonType.Success;
      case 2:
        return ButtonType.Error;
    }
  }

  @action
  retreat() {
    if (curIndex == 0 || status != 0) return;
    if (usArr[curIndex - 1]['isSpace']) curIndex--;
    for (int i = 0; i < sgArr.length; i++) {
      if (sgArr[i]['text'] == usArr[curIndex - 1]['text'] &&
          sgArr[i]['active']) {
        usArr[curIndex - 1]['text'] = "";
        sgArr[i]['active'] = false;
        curIndex--;
        break;
      }
    }
  }

  @action
  onItemTap(index, Function(int) callback) {
    if (status != 0 || sgArr[index]['active'] || curIndex == usArr.length)
      return;

    sgArr[index]['active'] = true;
    curAnswer += sgArr[index]['text'];
    if (usArr[curIndex]['isSpace']) {
      curIndex++;
    }
    usArr[curIndex++]['text'] = sgArr[index]['text'];

    if (curIndex == usArr.length) {
      status = curAnswer == answer.split(RegExp('\\s+')).join() ? 1 : 2;
    }

    if (callback != null && status != 0) callback(status);
  }
}
