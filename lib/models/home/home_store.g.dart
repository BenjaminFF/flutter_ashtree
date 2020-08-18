// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStore, Store {
  final _$setsAtom = Atom(name: '_HomeStore.sets');

  @override
  List<dynamic> get sets {
    _$setsAtom.reportRead();
    return super.sets;
  }

  @override
  set sets(List<dynamic> value) {
    _$setsAtom.reportWrite(value, super.sets, () {
      super.sets = value;
    });
  }

  final _$curSetsAtom = Atom(name: '_HomeStore.curSets');

  @override
  List<dynamic> get curSets {
    _$curSetsAtom.reportRead();
    return super.curSets;
  }

  @override
  set curSets(List<dynamic> value) {
    _$curSetsAtom.reportWrite(value, super.curSets, () {
      super.curSets = value;
    });
  }

  final _$filterTextAtom = Atom(name: '_HomeStore.filterText');

  @override
  String get filterText {
    _$filterTextAtom.reportRead();
    return super.filterText;
  }

  @override
  set filterText(String value) {
    _$filterTextAtom.reportWrite(value, super.filterText, () {
      super.filterText = value;
    });
  }

  final _$onInitAsyncAction = AsyncAction('_HomeStore.onInit');

  @override
  Future<dynamic> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  final _$_HomeStoreActionController = ActionController(name: '_HomeStore');

  @override
  dynamic getFilteredSets(dynamic originSets, dynamic filterText) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.getFilteredSets');
    try {
      return super.getFilteredSets(originSets, filterText);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
sets: ${sets},
curSets: ${curSets},
filterText: ${filterText}
    ''';
  }
}
