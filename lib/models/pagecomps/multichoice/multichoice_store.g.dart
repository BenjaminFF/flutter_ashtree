// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'multichoice_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MultiChoiceStore on _MultiChoiceStore, Store {
  final _$optionsAtom = Atom(name: '_MultiChoiceStore.options');

  @override
  ObservableList<dynamic> get options {
    _$optionsAtom.reportRead();
    return super.options;
  }

  @override
  set options(ObservableList<dynamic> value) {
    _$optionsAtom.reportWrite(value, super.options, () {
      super.options = value;
    });
  }

  final _$statusAtom = Atom(name: '_MultiChoiceStore.status');

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

  final _$answerAtom = Atom(name: '_MultiChoiceStore.answer');

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

  final _$_MultiChoiceStoreActionController =
      ActionController(name: '_MultiChoiceStore');

  @override
  dynamic onInit(String term, String definition, List<dynamic> otherOptions) {
    final _$actionInfo = _$_MultiChoiceStoreActionController.startAction(
        name: '_MultiChoiceStore.onInit');
    try {
      return super.onInit(term, definition, otherOptions);
    } finally {
      _$_MultiChoiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getButtonType(dynamic index) {
    final _$actionInfo = _$_MultiChoiceStoreActionController.startAction(
        name: '_MultiChoiceStore.getButtonType');
    try {
      return super.getButtonType(index);
    } finally {
      _$_MultiChoiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onItemTap(dynamic index, dynamic Function(int) callback) {
    final _$actionInfo = _$_MultiChoiceStoreActionController.startAction(
        name: '_MultiChoiceStore.onItemTap');
    try {
      return super.onItemTap(index, callback);
    } finally {
      _$_MultiChoiceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
options: ${options},
status: ${status},
answer: ${answer}
    ''';
  }
}
