import 'package:ashtree/components/button/button_comp.dart';
import 'package:mobx/mobx.dart';

part 'multichoice_store.g.dart';

class MultiChoiceStore = _MultiChoiceStore with _$MultiChoiceStore;

abstract class _MultiChoiceStore with Store {
  @observable
  ObservableList options;
  @observable
  int status = 0; // 0:normal  1:success  2:error
  @observable
  String answer = '';

  @action
  onInit(String term, String definition, List otherOptions) {
    this.answer = term;
    options = ObservableList();
    otherOptions.forEach((text) {
      options.add({'active': false, 'text': text});
    });
    options.add({'active': false, 'text': term});
  }

  @action
  getButtonType(index) {
    if (status == 0) {
      return ButtonType.Plain;
    }

    if (options[index]['active']) {
      return status == 1 ? ButtonType.Success : ButtonType.Error;
    } else {
      return options[index]['text'] == answer
          ? ButtonType.Success
          : ButtonType.Plain;
    }
  }

  @action
  onItemTap(index, Function(int) callback) {
    if (status != 0) return;
    options[index]['active'] = true;
    status = options[index]['text'] == answer ? 1 : 2;
    if (callback != null) callback(status);
  }
}
