import 'package:mobx/mobx.dart';
import 'services/local_storage/shared_preferances_service.dart';

// Include generated file
part 'counter.g.dart';

// This is the class used by rest of your codebase
class Counter = _Counter with _$Counter;

// The store-class
abstract class _Counter with Store {
  SharedPreferanceService preferanceService = SharedPreferanceService();

  @observable
  int value = 0;

  @action
  init() async {
    int counter = await preferanceService.getCounter();
    value = counter ?? 1;
  }

  @action
  void increment() {
    value = value + 1;
    preferanceService.setCounter(value);
  }
}
