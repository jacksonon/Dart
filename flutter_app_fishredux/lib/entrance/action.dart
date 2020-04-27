import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum EntranceAction { changeShowLabel, openGrid}

class EntranceActionCreator {
  // 改变showLabel文案的方法，根据我的理解会映射到effect中
  static Action onChangeShowLabel() {
    print('调用修改文本方法onChangeShowLabel');
    return const Action(EntranceAction.changeShowLabel);
  }

  static Action onOpenGrid() {
    return const Action(EntranceAction.openGrid);
  }
}