import 'package:fish_redux/fish_redux.dart';
import 'item/state.dart';

//TODO replace with your own action
enum listAction { action , initList}

class listActionCreator {
  static Action onAction() {
    return const Action(listAction.action);
  }

  // 带参数初始化
  static Action onInitList(List<ItemState> items) {
    return Action(listAction.initList, payload: items);
  }
}
