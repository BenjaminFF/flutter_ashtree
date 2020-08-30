import 'package:ashtree/services/utils/util_service.dart';
import 'package:mobx/mobx.dart';
import 'package:ashtree/services/web_api/api.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  List<dynamic> sets, curSets;
  @observable
  String filterText = '';

  @action
  Future onInit() async {
    var res = await Api().listSets();
    sets = res['data']['sets'];
    sets.forEach((element) {
      element['color']=UtilService().getRandomColor();
    });
    curSets = sets;
  }

  @action
  getFilteredSets(originSets, filterText) {
    List sets = [];
    if (filterText.length == 0) {
      return originSets;
    }

    if (filterText.substring(0, 1) == '\$') {
      if (filterText.contains('plan')) {
        sets = originSets
            .where((set) => UtilService().isLearnByDate(set['startplantime']))
            .toList();
      } else {
        //没有找到的指令暂时为originSets
        sets = originSets;
      }
    } else {
      sets = originSets
          .where((set) => set['name'].toString().contains(filterText))
          .toList();
    }
    return sets;
  }

  @action
  onChanged({String value}) {
    filterText = value;
    curSets = getFilteredSets(sets, filterText);
  }
}
