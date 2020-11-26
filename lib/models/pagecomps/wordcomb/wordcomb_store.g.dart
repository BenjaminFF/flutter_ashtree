// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wordcomb_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WordCombStore on _WordCombStore, Store {
  final _$usArrAtom = Atom(name: '_WordCombStore.usArr');

  @override
  ObservableList<dynamic> get usArr {
    _$usArrAtom.reportRead();
    return super.usArr;
  }

  @override
  set usArr(ObservableList<dynamic> value) {
    _$usArrAtom.reportWrite(value, super.usArr, () {
      super.usArr = value;
    });
  }

  final _$sgArrAtom = Atom(name: '_WordCombStore.sgArr');

  @override
  ObservableList<dynamic> get sgArr {
    _$sgArrAtom.reportRead();
    return super.sgArr;
  }

  @override
  set sgArr(ObservableList<dynamic> value) {
    _$sgArrAtom.reportWrite(value, super.sgArr, () {
      super.sgArr = value;
    });
  }

  final _$statusAtom = Atom(name: '_WordCombStore.status');

  @override
  int get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(int value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$answerAtom = Atom(name: '_WordCombStore.answer');

  @override
  String get answer {
    _$answerAtom.reportRead();
    return super.answer;
  }

  @override
  set answer(String value) {
    _$answerAtom.reportWrite(value, super.answer, () {
      super.answer = value;
    });
  }

  final _$isSpaceAtom = Atom(name: '_WordCombStore.isSpace');

  @override
  String get isSpace {
    _$isSpaceAtom.reportRead();
    return super.isSpace;
  }

  @override
  set isSpace(String value) {
    _$isSpaceAtom.reportWrite(value, super.isSpace, () {
      super.isSpace = value;
    });
  }

  final _$curIndexAtom = Atom(name: '_WordCombStore.curIndex');

  @override
  int get curIndex {
    _$curIndexAtom.reportRead();
    return super.curIndex;
  }

  @override
  set curIndex(int value) {
    _$curIndexAtom.reportWrite(value, super.curIndex, () {
      super.curIndex = value;
    });
  }

  final _$_WordCombStoreActionController =
      ActionController(name: '_WordCombStore');

  @override
  dynamic onInit(String term, String definition, int row) {
    final _$actionInfo = _$_WordCombStoreActionController.startAction(
        name: '_WordCombStore.onInit');
    try {
      return super.onInit(term, definition, row);
    } finally {
      _$_WordCombStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getButtonType(dynamic index) {
    final _$actionInfo = _$_WordCombStoreActionController.startAction(
        name: '_WordCombStore.getButtonType');
    try {
      return super.getButtonType(index);
    } finally {
      _$_WordCombStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic retreat() {
    final _$actionInfo = _$_WordCombStoreActionController.startAction(
        name: '_WordCombStore.retreat');
    try {
      return super.retreat();
    } finally {
      _$_WordCombStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onItemTap(dynamic index, dynamic Function(int) callback) {
    final _$actionInfo = _$_WordCombStoreActionController.startAction(
        name: '_WordCombStore.onItemTap');
    try {
      return super.onItemTap(index, callback);
    } finally {
      _$_WordCombStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usArr: ${usArr},
sgArr: ${sgArr},
status: ${status},
answer: ${answer},
isSpace: ${isSpace},
curIndex: ${curIndex}
    ''';
  }
}
