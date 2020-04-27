import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum gridAction { action, loadData , onOpenList}

class gridActionCreator {
  static Action onAction() {
    return const Action(gridAction.action);
  }
  static Action onLoadData() {
    return const Action(gridAction.loadData);
  }
  static Action onOpenList() {
    return const Action(gridAction.onOpenList);
  }
}
