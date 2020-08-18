import 'package:ashtree/services/utils/util_service.dart';
import 'package:mobx/mobx.dart';
import 'package:ashtree/services/web_api/api.dart';

part 'multichoice_store.g.dart';

class MultiChoiceStore = _MultiChoiceStore with _$MultiChoiceStore;

abstract class _MultiChoiceStore with Store {
  @observable
  List options;
  @observable
  int status = 0; // 0:normal  1:success  2:error
  @observable
  String term = '';

  @action
  onInit(String term, String definition, List otherOptions) {
    this.term = term;
    options = List();
    otherOptions.forEach((text) {
      options.add({'active': false, 'text': text});
    });
    options.add({'active': false, 'text': term});
  }
}
