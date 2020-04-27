import 'package:fish_redux/fish_redux.dart';
import 'package:flutterappfishredux/store/action.dart';
import 'package:flutterappfishredux/store/store.dart';
import 'action.dart';
import 'state.dart';

Effect<ItemState> buildEffect() {
  return combineEffects(<Object, Effect<ItemState>>{
    ItemAction.action: _onAction,
    // 接收事件，并发送之前定义的全局修改主题色
    ItemAction.onThemeChange: _onThemeChange,
  });
}

void _onThemeChange(Action action, Context<ItemState> ctx) {
  GlobalStore.store.dispatch(GlobalActionCreator.onChangeThemeColor());
}

void _onAction(Action action, Context<ItemState> ctx) {
}

