import 'package:ashtree/services/utils/util_service.dart';
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
    terms == new List<Map>();
    for (int i = 0; i < minTermCount; i++) {
      terms.add({'term': '', 'description': ''});
    }
  }

  
}
