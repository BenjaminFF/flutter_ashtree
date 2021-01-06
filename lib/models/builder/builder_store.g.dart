// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'builder_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BuilderStore on _BuilderStore, Store {
  final _$nameAtom = Atom(name: '_BuilderStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_BuilderStore.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$termsAtom = Atom(name: '_BuilderStore.terms');

  @override
  List<Map<dynamic, dynamic>> get terms {
    _$termsAtom.reportRead();
    return super.terms;
  }

  @override
  set terms(List<Map<dynamic, dynamic>> value) {
    _$termsAtom.reportWrite(value, super.terms, () {
      super.terms = value;
    });
  }

  final _$minTermCountAtom = Atom(name: '_BuilderStore.minTermCount');

  @override
  int get minTermCount {
    _$minTermCountAtom.reportRead();
    return super.minTermCount;
  }

  @override
  set minTermCount(int value) {
    _$minTermCountAtom.reportWrite(value, super.minTermCount, () {
      super.minTermCount = value;
    });
  }

  final _$curFocusIndexAtom = Atom(name: '_BuilderStore.curFocusIndex');

  @override
  int get curFocusIndex {
    _$curFocusIndexAtom.reportRead();
    return super.curFocusIndex;
  }

  @override
  set curFocusIndex(int value) {
    _$curFocusIndexAtom.reportWrite(value, super.curFocusIndex, () {
      super.curFocusIndex = value;
    });
  }

  final _$onInitAsyncAction = AsyncAction('_BuilderStore.onInit');

  @override
  Future<dynamic> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  final _$_BuilderStoreActionController =
      ActionController(name: '_BuilderStore');

  @override
  dynamic insertItem(dynamic index) {
    final _$actionInfo = _$_BuilderStoreActionController.startAction(
        name: '_BuilderStore.insertItem');
    try {
      return super.insertItem(index);
    } finally {
      _$_BuilderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(dynamic index) {
    final _$actionInfo = _$_BuilderStoreActionController.startAction(
        name: '_BuilderStore.removeItem');
    try {
      return super.removeItem(index);
    } finally {
      _$_BuilderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onValueChange(String type, int index, String value) {
    final _$actionInfo = _$_BuilderStoreActionController.startAction(
        name: '_BuilderStore.onValueChange');
    try {
      return super.onValueChange(type, index, value);
    } finally {
      _$_BuilderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onValidate() {
    final _$actionInfo = _$_BuilderStoreActionController.startAction(
        name: '_BuilderStore.onValidate');
    try {
      return super.onValidate();
    } finally {
      _$_BuilderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic disposeFocus() {
    final _$actionInfo = _$_BuilderStoreActionController.startAction(
        name: '_BuilderStore.disposeFocus');
    try {
      return super.disposeFocus();
    } finally {
      _$_BuilderStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
description: ${description},
terms: ${terms},
minTermCount: ${minTermCount},
curFocusIndex: ${curFocusIndex}
    ''';
  }
}
